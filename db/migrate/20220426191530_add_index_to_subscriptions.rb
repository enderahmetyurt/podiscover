class AddIndexToSubscriptions < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  
  def change
    add_index :subscriptions, [:user_id, :podcast_id], unique: true, name: "index_subscriptions_on_user_id_and_podcast_id", algorithm: :concurrently
  end
end
