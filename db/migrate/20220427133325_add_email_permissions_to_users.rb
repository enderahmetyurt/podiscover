class AddEmailPermissionsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :allow_email_usage_at, :datetime
    add_column :users, :tmp_email, :string
  end
end
