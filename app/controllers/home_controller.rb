# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to activities_path if current_user
  end
end
