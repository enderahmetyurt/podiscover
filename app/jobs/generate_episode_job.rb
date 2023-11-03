class GenerateEpisodeJob
  include Sidekiq::Worker
  sidekiq_options queue: "default", retry: 2

  def perform(podcast_id)
    podcast = Podcast.find(podcast_id)
    puts "For podcast #{podcast.name} starts to fetch episodes"

    begin
      podcast_response = RSpotify::Show.find(podcast.uid, market: "US")
    rescue RestClient::NotFound
      puts "Error Podcast: #{podcast.name}"
    end

    return if podcast_response.nil?

    episodes = podcast_response.episodes
    latest_episode = podcast.episodes.max_by { |e| e.release_date.to_date }

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
      ep = Episode.find_or_initialize_by(uid: episode.id)
      ep.duration_ms = episode.duration_ms
      ep.external_urls = episode.external_urls["spotify"]
      ep.html_description = episode.html_description
      ep.uid = episode.id
      ep.language = episode.language
      ep.name = episode.name
      ep.release_date = episode.release_date
      ep.podcast_id = podcast.id
      ep.save!

      if ep.episode_image_urls.any?
        ep.episode_image_urls.destroy_all
      end
      episode.images.each do |image|
        EpisodeImageUrl.create(url: image["url"], height: image["height"], width: image["width"], episode_id: ep.reload.id)
      end

      # audio_preview_url can raise a 404 error
      ep.update(audio_preview_url: episode.audio_preview_url)
    rescue
      puts "Error Podcast Episode: #{podcast.name} - #{episode.name}"
    end
  end
end
