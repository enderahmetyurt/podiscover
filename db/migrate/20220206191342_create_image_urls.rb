class CreateImageUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :image_urls do |t|
      t.string :url
      t.integer :height
      t.integer :width
      t.integer :podcast_id

      t.timestamps
    end
  end
end
