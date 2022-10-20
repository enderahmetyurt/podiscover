# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_user, except: [:index]
  layout "email_confirmation_layout", only: [:email_confirmation]

  def index
    users = User.where.not(id: current_user.id).to_a
    @users = users.sort_by!{ |user| user.podcasts.count }.reverse
  end

  def show
    @subscriptions = @user.subscriptions
  end

  def following
    @title = 'Following'
    @users = @user.following
  end

  def followers
    @title = 'Followers'
    @users = @user.followers
  end

  def email_confirmation; end

  def allow_email_confirmation
    @user.update(allow_email_usage_at: Time.now, tmp_email: nil)

    redirect_to subscriptions_path
  end

  def deny_email_confirmation
    @user.update(allow_email_usage_at: nil, tmp_email: tmp_email_generator)

    redirect_to subscriptions_path
  end

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end

  def tmp_email_generator
    SecureRandom.hex(10) + '@example.com'
  end
end
