# frozen_string_literal: true

class Podcast < ApplicationRecord
  validates :name, uniqueness: true

  has_many :subscriptions
  has_many :users, through: :subscriptions, source: :user
  
  has_many :image_urls, dependent: :destroy
  has_many :episodes, dependent: :destroy

  has_many :genres, dependent: :destroy
  has_many :categories, through: :genres
end
