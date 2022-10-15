class Broadcastable < ApplicationRecord
  AVAILABLE_ACTIONS = %w(new_user_has_joined).freeze

  validates :action, inclusion: { in: AVAILABLE_ACTIONS }

  def new_user_has_joined?
    action == 'new_user_has_joined'
  end
end
