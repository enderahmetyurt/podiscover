# frozen_string_literal: true

class EpisodesController < ApplicationController
  before_action :authenticate_user!

  def show
    @podcast = Podcast.find(params[:podcast_id])
    @episode = @podcast.episodes.find(params[:id])
  end
end