# frozen_string_literal: true

class Episode < ApplicationRecord
  has_many :episode_image_urls, dependent: :destroy
  belongs_to :podcast
end
