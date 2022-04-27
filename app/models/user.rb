# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:spotify]

  has_many :subscriptions, dependent: :destroy
  has_many :podcasts, through: :subscriptions, source: :podcast

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

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

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Subscription.where("user_id IN (#{following_ids})", user_id: id)
  end

  def self.image(auth)
    return nil if auth.info.images.empty?

    auth.info.images.first.url
  end
end
