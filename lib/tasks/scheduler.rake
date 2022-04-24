# frozen_string_literal: true

desc "Fetch episodes from all subscribed podcasts"
task fetch_podcasts: :environment do
  puts "Start fetching podcasts"
  podcasts = Podcast.all
  
  podcasts.each do |podcast|
    GenerateEpisodeJob.perform_async(podcast.id)
  end  
  
  puts "Finished fetching podcasts"
end