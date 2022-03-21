class UserMailer < ApplicationMailer
  def new_follower_email
    @follower = params[:follower]
    @followed = params[:followed]

    mail(to: @followed.email, subject: "You have a new follower 🥳")
  end  
end
