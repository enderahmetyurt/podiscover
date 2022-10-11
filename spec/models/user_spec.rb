require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'after create callbacks' do
    let(:user) { FactoryBot.create(:user) }

    it "should send new user email after a user created" do
      user
      expect(ActionMailer::Base.deliveries.last.to).to eq([ENV['ADMIN_EMAIL']])
    end

    it "should create related broadcastable" do
      expect{ user }.to change { Broadcastable.count }.by 1
      expect(user.activities.broadcastables).not_to be_empty
      expect(user.activities.first.broadcastable.action).to eq 'new_user_has_joined'
    end
  end
end
