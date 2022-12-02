# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user
  delegated_type :activatable, types: %w[Listen Commentable Likeable Broadcastable Followable]

  scope :githubish_sort, -> { in_order_of(:activatable_type, ACTIVITY_TYPE_ORDER_PRIORITY) }

  ACTIVITY_TYPE_ORDER_PRIORITY = ['Broadcastable', 'Commentable', 'Likeable', 'Followable'].freeze

end
