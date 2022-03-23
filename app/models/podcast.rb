# frozen_string_literal: true

class Podcast < ApplicationRecord
  belongs_to :user
  has_many :image_urls, dependent: :destroy

  def listener_count
    Podcast.where(name:).count
  end

  def listeners
    user_ids = Podcast.where(uid: uid).pluck(:user_id)
    User.where(id: user_ids)
  end
end
