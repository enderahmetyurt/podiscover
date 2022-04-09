# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @subscriptions = current_user.feed.uniq { |s| s.podcast_id }
  end

  def show
    @subscription = current_user.subscriptions.find(params[:id])
  end
end
