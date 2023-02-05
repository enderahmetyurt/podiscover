# frozen_string_literal: true
require 'open-uri'

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:spotify]

  has_many :subscriptions, dependent: :destroy
  has_many :podcasts, through: :subscriptions, source: :podcast
  has_many :user_listened_episodes, class_name: 'UserListenedEpisode'
  has_many :listened_episodes, through: :user_listened_episodes, source: :episode

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :activities, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :openai_requests

  after_create :send_new_user_email, :create_broadcast_activity

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)

    if user.present?
      user.update!(
        display_name: auth.info.display_name,
        image_url: User.image(auth),
        external_url: auth.info.external_urls['spotify']
      )
    else
      user = User.new
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.display_name = auth.info.display_name
      user.external_url = auth.info.external_urls['spotify']
      user.image_url = image(auth)
      user.password = Devise.friendly_token[0, 20]
      user.daily_openai_credit = 10

      user.save!
    end

    FetchUserPodcasts.perform_async(user.id, auth)

    user
  end

  def display_email
    if allow_email_confirmation
      email
    else
      'Hidden'
    end
  end

  def is_admin?
    email == ENV['ADMIN_EMAIL']
  end

  def nickname
    display_name.present? ? display_name : email.split('@').first
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
    Activity.create!(activatable: Followable.create(follower_id: id, followed_id: other_user.id, action: 'followed'), user_id: id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
    Activity.create!(activatable: Followable.create(follower_id: id, followed_id: other_user.id, action: 'unfollowed'), user_id: id)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Subscription.where("user_id IN (#{following_ids})", user_id: id)
  end

  def activity_feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Activity.where("user_id IN (#{following_ids})", user_id: id)
      .or(Activity.broadcastables.where.not(user_id: id))
      .order(created_at: :desc)
  end

  def self.image(auth)
    return nil if auth.info.images.empty?

    profile_image_url = auth.info.images.first.url

    begin
      URI.parse(profile_image_url).open
      profile_image_url
    rescue
      nil
    end
  end

  def send_new_user_email
    UserMailer.new_user(self).deliver_now
  end

  def create_broadcast_activity
    Activity.create!(activatable: Broadcastable.new(action: 'new_user_has_joined'),
                     user_id: id)
  end

  def slug_candidates
    [
      :sluggified_nickname,
      [:sluggified_nickname, SecureRandom.hex(2)]
    ]
  end

  def can_openai?
    daily_openai_credit > 0
  end

  def categories_count
    query = "select c.name, count(*) as count from subscriptions as u
      inner join podcasts as p on u.podcast_id = p.id
      inner join genres as g on g.podcast_id = p.id
      inner join categories as c on g.category_id = c.id
      where u.user_id = #{id}
      group by c.name
      order by count desc"

    results = ActiveRecord::Base.connection.execute(query)

    if results.present?
      results.to_a.first(3).map{|r| r["name"]}
    end
  end

  def description
    "subscribes #{self.subscriptions.count} podcasts"
  end

  private

  def sluggified_nickname
    nickname.parameterize
  end
end
