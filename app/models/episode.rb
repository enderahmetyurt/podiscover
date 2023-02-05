# frozen_string_literal: true

class Episode < ApplicationRecord
  has_many :episode_image_urls, dependent: :destroy
  belongs_to :podcast
  has_many :comments, dependent: :destroy
  has_many :user_listened_episodes, class_name: 'UserListenedEpisode'
  has_many :listeners, through: :user_listened_episodes, source: :user

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

  def listed_by?(user)
    self.listeners.where(id: user.id).any?
  end
end
