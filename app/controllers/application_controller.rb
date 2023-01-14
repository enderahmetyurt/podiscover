# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  before_action :record_page_view

  def after_sign_in_path_for(resource)
    if resource.allow_email_usage_at.nil?
      email_confirmation_user_path(resource)
    else
      activities_path
    end
  end

  def record_page_view
    # Add a condition to record only your canonical domain
    # and use a gem such as crawler_detect to skip bots.
    ActiveAnalytics.record_request(request)
  end

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path
    end
  end
end
