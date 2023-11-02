class FindLatestEpisodeJob
  include Sidekiq::Worker
  sidekiq_options queue: "default"

  def perform(user_id)
    @user = User.find(user_id)
    @podcasts = @user.podcasts
    new_episodes = []

    @podcasts.each do |podcast|
      podcast.episodes.each do |episode|
        if episode.release_date.to_date == Date.current
          new_episodes << episode
        end
      end
    end

    if new_episodes.any?
      UserMailer.new_episodes(@user, new_episodes).deliver_now
    end
  end
end
