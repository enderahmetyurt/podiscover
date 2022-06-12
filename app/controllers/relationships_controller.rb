# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  include ActionView::RecordIdentifier

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)

    if user.allow_email_usage_at.present?
      UserMailer.with(follower: current_user, followed: user).new_follower_email.deliver_later
    end

    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)

    redirect_to user
  end
end
