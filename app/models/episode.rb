# frozen_string_literal: true

class Episode < ApplicationRecord
  has_many :episode_image_urls, dependent: :destroy
  belongs_to :podcast
  has_many :comments, dependent: :destroy

  def language_emoji
    if language.include?('en')
      '🇬🇧'
    elsif language.include?('tr')
      '🇹🇷'
    elsif language.include?('de')
      '🇩🇪'
    elsif language.include?('se')
      '🇸🇪'
    else
      '🌐'
    end
  end
end
