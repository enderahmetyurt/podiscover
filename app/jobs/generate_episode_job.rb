class GenerateEpisodeJob
  include Sidekiq::Worker
  sidekiq_options queue: "default"

  def perform(podcast_id)
    podcast = Podcast.find(podcast_id)
    puts "For podcast #{podcast.name} starts to fetch episodes"
    response = nil
    episodes = []
    i = 0
    
    begin
      podcast_response = RSpotify::Show.find(podcast.uid, market: 'US')
    rescue RestClient::NotFound => e
      puts "Error Podcast: #{podcast.name}"
    end

    episodes = podcast_response.episodes
    latest_episode = podcast.episodes.sort_by { |e| e.release_date.to_date }.last

    if podcast.episodes.empty?
      save_episodes(episodes, podcast)
    elsif episodes.count > 0 && (episodes.first.release_date.to_date > latest_episode.release_date.to_date)
      save_episodes(episodes, podcast)
    else
      puts "No new episodes for #{podcast.name}"
    end
  end

  private

  def save_episodes(episodes, podcast)
    episodes.each do |episode|
      begin
        ep = Episode.find_or_initialize_by(uid: episode.id)
        ep.duration_ms = episode.duration_ms
        ep.external_urls = episode.external_urls['spotify']
        ep.html_description = episode.html_description
        ep.uid = episode.id
        ep.language = episode.language
        ep.name = episode.name
        ep.release_date = episode.release_date
        ep.podcast_id = podcast.id
        ep.save!

        if ep.episode_image_urls.any?
          ep.episode_image_urls.destroy_all
          episode.images.each do |image|
            EpisodeImageUrl.create(url: image['url'], height: image['height'], width: image['width'], episode_id: ep.reload.id)
          end
        else 
          episode.images.each do |image|
            EpisodeImageUrl.create(url: image['url'], height: image['height'], width: image['width'], episode_id: ep.reload.id)
          end
        end

        # audio_preview_url can raise a 404 error
        ep.update(audio_preview_url: episode.audio_preview_url)
      rescue => e
        puts "Error Podcast Episode: #{podcast.name} - #{episode.name}"
      end        
    end 
  end    
end
