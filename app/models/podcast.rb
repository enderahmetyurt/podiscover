# frozen_string_literal: true

class Podcast < ApplicationRecord
  validates :name, uniqueness: true

  has_many :subscriptions
  has_many :users, through: :subscriptions, source: :user

  has_many :image_urls, dependent: :destroy
  has_many :episodes, dependent: :destroy

  has_many :genres, dependent: :destroy
  has_many :categories, through: :genres

  def self.today_podcast
    find_by(podcast_of_the_day_at: Date.today.all_day)
  end
end
