class Comment < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :episode
  belongs_to :user

  validates :body, presence: true
  validates :body, length: { maximum: 5, too_long: "%{count} characters is the maximum allowed" }
end
