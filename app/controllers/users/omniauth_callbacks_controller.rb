# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :spotify

  def spotify
    @user = User.from_omniauth(request.env['omniauth.auth'])

    sign_in_and_redirect @user
  end

  def failure
    redirect_to root_path
  end
end
