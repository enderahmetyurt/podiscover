class CreateGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :genres do |t|
      t.integer :podcast_id
      t.integer :category_id

      t.timestamps
    end
  end
end
