# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @subscriptions = current_user.feed  
  end

  def show
    @subscription = current_user.subscriptions.find(params[:id])
  end
end
