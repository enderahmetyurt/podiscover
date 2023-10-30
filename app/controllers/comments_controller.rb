# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.episode_id = params[:episode_id]
    @comment.user_id = current_user.id

    if @comment.save
      Activity.create!(activatable: Commentable.new(comment_id: @comment.id, episode_id: @comment.episode.id), user_id: current_user.id)
      CommentMailer.new_comment_for_host(@comment).deliver_now if @comment.episode.podcast.owner.present?
    end

    redirect_to podcast_episode_path(@comment.episode.podcast.id, @comment.episode_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
