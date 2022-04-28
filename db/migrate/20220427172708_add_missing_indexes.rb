class AddMissingIndexes < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  
  def change
    add_index :image_urls, :podcast_id, name: "index_image_urls_on_podcast_id", algorithm: :concurrently
    add_index :episodes, :podcast_id, name: "index_episodes_on_podcast_id", algorithm: :concurrently
    add_index :episode_image_urls, :episode_id, name: "index_episode_image_urls_on_episode_id", algorithm: :concurrently    
  end
end
