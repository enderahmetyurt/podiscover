# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.allow_email_usage_at.nil?
      email_confirmation_user_path(resource) 
    else
      subscriptions_path
    end
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
