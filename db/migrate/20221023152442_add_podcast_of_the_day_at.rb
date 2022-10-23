class AddPodcastOfTheDayAt < ActiveRecord::Migration[7.0]
  def change
    add_column :podcasts, :podcast_of_the_day_at, :datetime
  end
end
