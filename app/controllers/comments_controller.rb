# frozen_string_literal: true

class CommentsController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    @comment = Comment.new(comment_params)
    @comment.episode_id = params[:episode_id]
    @comment.user_id = current_user.id

    if @comment.save
      Activity.create!(activityable: Commentable.new(comment_id: @comment.id, episode_id: @comment.episode.id), user_id: current_user.id)

      redirect_to podcast_episode_path(@comment.episode.podcast.id, @comment.episode_id)
    else
      redirect_to podcast_episode_path(@comment.episode.podcast.id, @comment.episode_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
