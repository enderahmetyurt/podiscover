# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def new_order_email
    Relationship.destroy_all
    user = User.first
    user2 = User.last
    user.follow(user2)

    UserMailer.with(follower: user, user: user2).new_follower_email
  end
end
