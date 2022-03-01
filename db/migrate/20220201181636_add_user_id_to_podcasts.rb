# frozen_string_literal: true

class AddUserIdToPodcasts < ActiveRecord::Migration[7.0]
  def change
    add_column :podcasts, :user_id, :integer
  end
end
