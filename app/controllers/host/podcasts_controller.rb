# frozen_string_literal: true

module Host
  class PodcastsController < ApplicationController
    layout "host"

    before_action :authenticate_user!
    before_action :check_host

    def index
      @shows = current_user.own_shows
    end

    def episodes
      podcast = Podcast.find(params[:podcast_id])

      @episodes = podcast.episodes.order("#{params[:column]} #{params[:direction]}")
    end

    private

    def check_host
      redirect_to root_path unless current_user.host?
    end
  end
end
