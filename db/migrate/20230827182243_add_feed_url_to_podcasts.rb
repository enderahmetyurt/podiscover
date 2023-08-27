class AddFeedUrlToPodcasts < ActiveRecord::Migration[7.0]
  def change
    add_column :podcasts, :feed_url, :string
  end
end
