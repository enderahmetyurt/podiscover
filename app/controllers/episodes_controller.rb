# frozen_string_literal: true

class EpisodesController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :authenticate_user!, only: [:index]

  def index
    @podcast = Podcast.find(params[:podcast_id])
    sorted_episodes = @podcast.episodes.sort_by { |e| e.release_date.to_date }.reverse
    @pagy, @episodes = pagy_array(sorted_episodes, items: 30)
  end

  def show
    @podcast = Podcast.find(params[:podcast_id])
    @episode = @podcast.episodes.find(params[:id])
  end

  def like
    @episode = Episode.find(params[:episode_id])

    @episode.increment!(:likes)
    Activity.create!(activatable: Likeable.new(podcast_id: @episode.podcast.id, episode_id: @episode.id, action: 'liked'), user_id: current_user.id)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "#{dom_id(@episode)}_likes",
          partial: 'episodes/likes',
          locals: { episode: @episode, action: 'dislike' }
        )
      end
    end
  end

  def dislike
    @episode = Episode.find(params[:episode_id])

    @episode.decrement!(:likes)
    Activity.create!(activatable: Likeable.new(podcast_id: @episode.podcast.id, episode_id: @episode.id, action: 'disliked'), user_id: current_user.id)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "#{dom_id(@episode)}_likes",
          partial: 'episodes/likes',
          locals: { episode: @episode, action: 'like' }
        )
      end
    end
  end

  def marked_as_listened
    @episode = Episode.find(params[:episode_id])

    UserListenedEpisode.create!(user_id: current_user.id, episode_id: @episode.id) unless @episode.listed_by?(current_user)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "#{dom_id(@episode)}_listens",
          partial: 'episodes/listens',
          locals: { episode: @episode, action: 'unlistened' }
        )
      end
    end
  end

  def marked_as_unlistened
    @episode = Episode.find(params[:episode_id])

    UserListenedEpisode.find_by(user_id: current_user.id, episode_id: @episode.id).destroy if @episode.listed_by?(current_user)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "#{dom_id(@episode)}_listens",
          partial: 'episodes/listens',
          locals: { episode: @episode, action: 'listened' }
        )
      end
    end
  end
end