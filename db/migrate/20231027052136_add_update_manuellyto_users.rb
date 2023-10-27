class AddUpdateManuellytoUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :update_manuelly, :boolean, default: false
  end
end
