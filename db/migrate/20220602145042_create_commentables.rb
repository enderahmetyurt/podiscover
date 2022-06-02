class CreateCommentables < ActiveRecord::Migration[7.0]
  def change
    create_table :commentables do |t|
      t.integer :comment_id
      t.integer :episode_id

      t.timestamps
    end
  end
end
