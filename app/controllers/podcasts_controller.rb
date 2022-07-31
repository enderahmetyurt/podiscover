# frozen_string_literal: true

class PodcastsController < ApplicationController
  before_action :authenticate_user!

  def index
    @subscriptions = current_user.subscriptions
  end

  def show
    @podcast = Podcast.find(69)
    @all_episodes = @podcast.episodes.sort_by { |e| e.release_date.to_date }.reverse
    @episodes = @all_episodes.first(5)
  end
end
