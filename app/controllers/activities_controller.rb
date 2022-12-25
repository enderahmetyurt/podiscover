# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @podcast = Podcast.today_podcast
    activities = current_user.activity_feed
    @pagy, @activities = pagy_array(activities, items: 30)
  end
end
