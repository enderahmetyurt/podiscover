class Broadcastable < ApplicationRecord
  FOO = { :new_user, :new_version }

  validates_presence_of :action
end
