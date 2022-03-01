class DashboardController < ApplicationController
  def index
    @podcasts = current_user.podcasts
  end
end
