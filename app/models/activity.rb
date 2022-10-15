# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user
  delegated_type :activatable, types: %w[Listen Commentable Likeable Broadcastable]
end
