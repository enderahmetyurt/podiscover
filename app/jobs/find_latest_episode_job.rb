class FindLatestEpisodeJob
  include Sidekiq::Worker
  sidekiq_options queue: "default"

  def perform(user_id)
    @user = User.find(user_id)
    @podcasts = @user.podcasts
    new_episodes = @user.podcasts.joins(:episodes).where(episodes: {release_date: Date.current})

    if new_episodes.any?
      UserMailer.new_episodes(@user, new_episodes).deliver_now
    end
  end
end
