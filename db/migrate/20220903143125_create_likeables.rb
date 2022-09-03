class CreateLikeables < ActiveRecord::Migration[7.0]
  def change
    create_table :likeables do |t|
      t.integer :podcast_id
      t.integer :episode_id
      t.string :action

      t.timestamps
    end
  end
end
