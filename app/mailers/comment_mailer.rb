class CommentMailer < ApplicationMailer
  def new_comment_for_host(comment)
    @comment = comment
    @episode = comment.episode
    @podcast = @episode.podcast
    @host = @podcast.owner

    mail(to: @host.email, subject: "You have a new comment")
  end
end
