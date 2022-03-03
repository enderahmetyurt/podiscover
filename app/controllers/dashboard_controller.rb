class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @pagy, @podcasts = pagy_countless(current_user.podcasts)
  end
end
