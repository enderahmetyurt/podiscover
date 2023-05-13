class UserMailer < ApplicationMailer
  def new_follower_email
    @follower = params[:follower]
    @followed = params[:followed]

    mail(to: @followed.email, subject: "You have a new follower 🥳")
  end

  def new_user(user)
    @user = user
    mail(to: ENV["ADMIN_EMAIL"], subject: "A new user has joined 🥹")
  end
end
