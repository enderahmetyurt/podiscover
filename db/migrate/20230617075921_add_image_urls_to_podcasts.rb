class AddImageUrlsToPodcasts < ActiveRecord::Migration[7.0]
  def change
    add_column :podcasts, :extras, :jsonb, default: {}
  end
end
