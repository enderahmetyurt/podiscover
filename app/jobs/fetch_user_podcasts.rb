class FetchUserPodcasts
  include Sidekiq::Worker
  sidekiq_options queue: "default"

  def perform(user_id, auth)
    spotify_user = RSpotify::User.new(auth)
    podcasts = []
    response = nil
    i = 0

    until response.present?
      response = spotify_user.saved_shows(limit: 50, offset: i)

      if response.present?
        podcasts += response
        i += 1
        response = nil
      else
        break
      end
    end

    remove_missing_podcasts(user_id, podcasts)

    podcasts.each do |podcast|
      pp = Podcast.find_or_initialize_by(uid: podcast.id)

      pp.name = podcast.name
      pp.description = podcast.description
      pp.uid = podcast.id
      pp.language = podcast.languages.first # TODO: make it an array
      pp.publisher = podcast.publisher
      pp.uri = podcast.uri
      pp.external_url = podcast.external_urls['spotify']

      pp.save!

      if pp.image_urls.any?
        pp.image_urls.destroy_all
        podcast.images.each do |image|
          ImageUrl.create(url: image['url'], height: image['height'], width: image['width'], podcast_id: pp.reload.id)
        end
      else
        podcast.images.each do |image|
          ImageUrl.create(url: image['url'], height: image['height'], width: image['width'], podcast_id: pp.reload.id)
        end
      end

      subscription = Subscription.find_by(user_id: user_id, podcast_id: pp.id)

      if subscription.blank?
        Subscription.create!(user_id: user_id, podcast_id: pp.id)
        Activity.create!(activityable: Listen.new(podcast_id: pp.id, action: 'starts'), user_id: user_id)
      end
    end
  end

  private

  def remove_missing_podcasts(user_id, podcasts)
    user = User.find(user_id)
    user_podcasts = user.podcasts
    podcast_uids = user_podcasts.pluck(:uid)
    missing_podcast_ids = podcast_uids - podcasts.map(&:id)
    podcast_ids = user_podcasts.where(uid: missing_podcast_ids).pluck(:id)

    puts "Missing podcast ids: #{podcast_ids} for user #{user.email}"
    Subscription.where(user_id: user.id, podcast_id: podcast_ids).destroy_all

    podcast_ids.each do |podcast_id|
      Activity.create!(activityable: Listen.new(podcast_id: podcast_id, action: 'stops'), user_id: user_id)
    end
  end
end