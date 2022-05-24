class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :activityable_type
      t.integer :activityable_id

      t.timestamps
    end
  end
end
