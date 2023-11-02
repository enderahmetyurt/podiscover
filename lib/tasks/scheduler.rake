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

desc "Find podcast of the day"
task find_daily_podcast: :environment do
  puts "Start finding podcast of the day"
  FindPodcastOfTheDay.perform_async
  puts "Finished finding podcast of the day"
end

desc "Reset users openai credits"
task reset_user_openai_credits: :environment do
  puts "Start reset"
  User.update_all(daily_openai_credit: 10)
  puts "Finished reset"
end

desc "Set nil non reachable users image urls"
task fix_user_image_urls: :environment do
  puts "Start fixing"
  User.all.each do |user|
    puts "user: #{user.id} image_url: #{user.image_url}"
    begin
      URI.parse(user.image_url).open
    rescue
      user.update(image_url: nil)
    end
  end
  puts "Finish fixing"
end

desc "Send new episodes to user"
task send_new_episodes_to_user: :environment do
  User.find_each(batch_size: 100) do |user|
    FindLatestEpisodeJob.new(user.id)
  end
end
