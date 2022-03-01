# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if current_user
      redirect_to podcasts_path
    end
  end
end
