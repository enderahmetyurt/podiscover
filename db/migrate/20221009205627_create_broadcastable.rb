class CreateBroadcastable < ActiveRecord::Migration[7.0]
  def change
    create_table :broadcastables do |t|
      t.string :action

      t.timestamps
    end
  end
end
