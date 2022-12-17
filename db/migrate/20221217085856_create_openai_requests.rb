class CreateOpenaiRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :openai_requests do |t|
      t.text :prompt
      t.text :result
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
