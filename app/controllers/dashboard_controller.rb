# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @podcasts = current_user.podcasts
  end
end
