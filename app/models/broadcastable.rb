class Broadcastable < ApplicationRecord
  AVAILABLE_ACTIONS = %w(new_user_has_joined
                        new_version_has_released).freeze

  validates :action, inclusion: { in: AVAILABLE_ACTIONS }

  def new_user_has_joined?
    action == 'new_user_has_joined'
  end

  def new_version_has_released?
    action == 'new_version_has_released'
  end
end
