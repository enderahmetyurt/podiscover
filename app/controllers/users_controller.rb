# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @podcasts = @user.podcasts
  end

  # def following
  #   @title = 'Following'
  #   @user  = User.find(params[:id])
  #   @users = @user.following
    
  #   render 'show'
  # end

  # def followers
  #   @title = 'Followers'
  #   @user  = User.find(params[:id])
  #   @users = @user.followers
    
  #   render 'show'
  # end
end
