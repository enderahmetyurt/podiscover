# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  include ActionView::RecordIdentifier

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    
    if current_user.allow_email_usage?
      UserMailer.with(follower: current_user, followed: user).new_follower_email.deliver_later
    end

    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.replace(
    #       "#{dom_id(current_user)}_follows",
    #       partial: 'users/follower',
    #       locals: { user: user }
    #     )
    #   end
    # end

    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    
    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.replace(
    #       "#{dom_id(current_user)}_follows",
    #       partial: 'users/follower',
    #       locals: { user: user }
    #     )
    #   end
    # end

    redirect_to user
  end
end
