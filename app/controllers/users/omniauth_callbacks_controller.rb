# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :spotify

  def spotify
    @user = User.from_omniauth(request.env["omniauth.auth"])

    sign_in_and_redirect @user
  end

  def failure
    flash[:warn] = "🥺 This is a private beta project. Access to your Spotify account must be granted to continue."
    redirect_to root_path
  end
end
