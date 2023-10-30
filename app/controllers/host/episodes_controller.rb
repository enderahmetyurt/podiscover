# frozen_string_literal: true

module Host
  class EpisodesController < ApplicationController
    layout "host"

    before_action :authenticate_user!
    before_action :check_host

    def show
      podcast = Podcast.find(params[:podcast_id])
      @episode = podcast.episodes.find(params[:id])
    end

    private

    def check_host
      redirect_to root_path unless current_user.host?
    end
  end
end
