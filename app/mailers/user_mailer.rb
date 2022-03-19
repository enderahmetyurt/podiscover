class UserMailer < ApplicationMailer
  def new_follower_email
    @follower = params[:follower]
    @user = params[:user]

    mail(to: @follower.email, subject: "You have a new follower 🥳")
  end  
end
