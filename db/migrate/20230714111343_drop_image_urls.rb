class DropImageUrls < ActiveRecord::Migration[7.0]
  def change
    drop_table :image_urls, if_exist: true
  end
end
