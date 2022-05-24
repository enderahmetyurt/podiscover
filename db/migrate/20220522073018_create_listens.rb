class CreateListens < ActiveRecord::Migration[7.0]
  def change
    create_table :listens do |t|
      t.integer :podcast_id
      t.string :action

      t.timestamps
    end
  end
end
