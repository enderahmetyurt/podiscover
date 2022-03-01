# frozen_string_literal: true

class AddSomeFieldsToPodcasts < ActiveRecord::Migration[7.0]
  def change
    add_column :podcasts, :uid, :string
    add_column :podcasts, :language, :string
    add_column :podcasts, :publisher, :string
    add_column :podcasts, :uri, :string
    add_column :podcasts, :external_url, :string
  end
end
