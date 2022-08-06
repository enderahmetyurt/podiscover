class UpdateDelegatedTypeActivity < ActiveRecord::Migration[7.0]
  def change
    rename_column :activities, :activityable_type, :activatable_type
    rename_column :activities, :activityable_id, :activatable_id
  end
end
