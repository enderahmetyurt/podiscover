class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :podcast

  after_create_commit { broadcast_append_to "subscriptions" }
  after_destroy_commit { broadcast_remove_to "subscriptions" }
end
