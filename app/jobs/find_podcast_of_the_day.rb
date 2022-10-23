class FindPodcastOfTheDay
  include Sidekiq::Worker
  sidekiq_options queue: "default"

  def perform
    podcasts = Podcast.where(podcast_of_the_day_at: nil)
    ids = podcasts.pluck(:id)
    rand_number = rand(ids.count)

    podcast = podcasts.find(ids[rand_number])

    if podcast
      podcast.update(podcast_of_the_day_at: Time.now)
    else
      Podcast.first
    end
  end
end