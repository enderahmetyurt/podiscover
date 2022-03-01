# frozen_string_literal: true

class Podcast < ApplicationRecord
  belongs_to :user
  has_many :image_urls, dependent: :destroy
end
