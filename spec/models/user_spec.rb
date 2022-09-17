require 'rails_helper'

RSpec.describe User, :type => :model do
  it "should send new user email after a user created" do
    user = FactoryBot.create(:user)

    expect(ActionMailer::Base.deliveries.last.to).to eq([ENV['ADMIN_EMAIL']])
  end
end