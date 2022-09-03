class AddLikesToEpisodes < ActiveRecord::Migration[7.0]
  def change
    add_column :episodes, :likes, :integer, default: 0, null: false
  end
end
