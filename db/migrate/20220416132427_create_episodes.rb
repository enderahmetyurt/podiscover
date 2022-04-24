class CreateEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :episodes do |t|
      t.string :audio_preview_url
      t.bigint :duration_ms
      t.string :external_urls
      t.text :html_description
      t.string :uid
      t.string :language
      t.string :name
      t.string :release_date
      t.integer :podcast_id

      t.timestamps
    end
  end
end
