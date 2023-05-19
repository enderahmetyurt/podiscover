# frozen_string_literal: true

module Maintenance
  class UpdateCategoriesTask < MaintenanceTasks::Task
    def collection
      Podcast.all
    end

    def process(podcast)
      if podcast.categories.empty?
        podcast_name = podcast.name.parameterize
        url = "https://itunes.apple.com/search?term=#{podcast_name}&media=podcast"

        begin
          response = RestClient.get(url)
          if response.present? && response.code == 200
            body = JSON.parse(response.body)
            genres = body["results"].first["genres"]

            genres.each do |genre|
              next if genre == "Podcasts" # Not create category with Podcasts name

              category = Category.find_or_create_by(name: genre)
              podcast.categories << category
              podcast.save!
            end
          end
        rescue
          puts "Error raise"
        end
      end
    end
  end
end
