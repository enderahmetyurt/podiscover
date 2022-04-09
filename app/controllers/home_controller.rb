# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to subscriptions_path if current_user
  end
end
