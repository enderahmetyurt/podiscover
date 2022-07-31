# frozen_string_literal: true

class EpisodesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @podcast = Podcast.find(params[:podcast_id]) 
    sorted_episodes = @podcast.episodes.sort_by { |e| e.release_date.to_date }.reverse
    @pagy, @episodes = pagy_array(sorted_episodes, items: 30)
  end

  def show
    @podcast = Podcast.find(params[:podcast_id])
    @episode = @podcast.episodes.find(params[:id])
  end
end