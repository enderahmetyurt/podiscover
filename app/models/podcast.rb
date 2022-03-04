# frozen_string_literal: true

class Podcast < ApplicationRecord
  belongs_to :user
  has_many :image_urls, dependent: :destroy

  def listener_count
    count = Podcast.where(name: self.name).count
    if count > 1
      "#{count} listeners"
    else
      " #{count} listener"
    end
  end
end
