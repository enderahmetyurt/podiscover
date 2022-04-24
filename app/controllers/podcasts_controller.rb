# frozen_string_literal: true

class PodcastsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @subscriptions = current_user.subscriptions
    # podcasts = current_user.feed.uniq { |p| p.uid }
    # @podcasts = podcasts.sort_by!(&:listener_count).reverse
  end

  def show
    @podcast = Podcast.find(params[:id])
    @episodes = @podcast.episodes.sort_by { |e| e.release_date.to_date }.reverse
  end
end
