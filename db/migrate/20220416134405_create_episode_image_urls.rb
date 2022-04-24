class CreateEpisodeImageUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :episode_image_urls do |t|
      t.string :url
      t.integer :height
      t.integer :width
      t.integer :episode_id

      t.timestamps
    end
  end
end
