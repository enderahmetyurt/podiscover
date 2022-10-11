# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user, optional: true
  delegated_type :activatable, types: %w[ Listen Commentable Likeable Broadcastable]
end
