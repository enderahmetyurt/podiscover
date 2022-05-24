# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user
  delegated_type :activityable, types: %w[ Listen ]
end
