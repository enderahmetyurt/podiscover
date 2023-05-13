class Followable < ApplicationRecord
  AVAILABLE_ACTIONS = %w[followed unfollowed].freeze

  validates :action, inclusion: {in: AVAILABLE_ACTIONS}

  belongs_to :followed, class_name: "User"
end
