# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user, optional: true
  validates_presence_of :user, if: :user_owned_activity?

  delegated_type :activatable, types: %w[ Listen Commentable Likeable Broadcastable]

  def user_owned_activity?
    return false unless broadcastable? && broadcastable.new_version_has_released?
    true
  end
end
