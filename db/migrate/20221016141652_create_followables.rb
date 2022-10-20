class CreateFollowables < ActiveRecord::Migration[7.0]
  def change
    create_table :followables do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.string :action

      t.timestamps
    end
  end
end
