# frozen_string_literal: true

class AddNewFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :display_name, :string
    add_column :users, :external_url, :string
    add_column :users, :image_url, :string
  end
end
