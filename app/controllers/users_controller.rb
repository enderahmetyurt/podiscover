# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    users = User.where.not(id: current_user.id).to_a
    @users = users.sort_by!{ |user| user.podcasts.count }.reverse
  end

  def show
    @user = User.find(params[:id])
    @subscriptions = @user.subscriptions
  end

  def following
    @title = 'Following'
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @title = 'Followers'
    @user  = User.find(params[:id])
    @users = @user.followers
  end
end
