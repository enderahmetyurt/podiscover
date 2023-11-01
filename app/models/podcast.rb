# frozen_string_literal: true

class Podcast < ApplicationRecord
  validates :name, uniqueness: true

  has_many :subscriptions
  has_many :users, through: :subscriptions, source: :user

  has_many :episodes, -> { order(release_date: :desc) }, dependent: :destroy

  has_many :genres, dependent: :destroy
  has_many :categories, through: :genres

  belongs_to :owner, class_name: "User", optional: true

  def self.today_podcast
    if Rails.env.production?
      podcast_id = Rails.cache.fetch(:today_podcast, expires_at: Time.current.end_of_day) do
        find_by(podcast_of_the_day_at: Date.today.all_day).id
      end
      find(podcast_id)
    else
      first
    end
  end

  def self.search(query)
    where("name ILIKE :query or description ILIKE :query or publisher ILIKE :query", query: "%#{query}%")
  end

  def image_urls
    extras["image_urls"]
  end

  def total_likes_count
    episodes.map(&:likes).sum
  end

  def total_comments_count
    episodes.map(&:comments).count { |c| c.size > 0 }
  end
end
