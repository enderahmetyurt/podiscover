class AddOwnerIdToPodcasts < ActiveRecord::Migration[7.1]
  def change
    add_column :podcasts, :owner_id, :integer
  end
end
