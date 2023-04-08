# frozen_string_literal: true

class PodcastsController < ApplicationController
  before_action :authenticate_user!

  def index
    @subscriptions = current_user.subscriptions
  end

  def show
    return redirect_to podcasts_path unless params[:id].present?

    @podcast = Podcast.find(params[:id])
    @all_episodes = @podcast.episodes.sort_by { |e| e.release_date.to_date }.reverse
    @episodes = @all_episodes.first(5)
    @subscribers = @podcast.subscriptions.first(5)
  end

  def search
    if params[:query].present?
      @podcasts = Podcast.search(params[:query])
    else
      @podcasts = Podcast.all
    end
  end
end
