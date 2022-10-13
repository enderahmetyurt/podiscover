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

  describe '#activity_feed' do
    let!(:podcast) { FactoryBot.create(:podcast) }
    let!(:episode) { FactoryBot.create(:episode, podcast_id: podcast.id) }
    let!(:user) { FactoryBot.create(:user) }
    let!(:followed_user) { FactoryBot.create(:user) }
    let!(:relationship) { Relationship.create(follower_id: user.id, followed_id: followed_user.id) }
    let!(:likeable_activity) { Activity.create(activatable: Likeable.new(podcast_id: podcast.id, episode_id: episode.id), user_id: followed_user.id) }
    let!(:new_user) { FactoryBot.create(:user) }

    it 'should show new users broadcastable activity' do
      expect(user.activity_feed).to include(Activity.broadcastables.where(user_id: new_user.id).first)
    end

    it 'should not show its own broadcastable activity' do
      expect(user.activity_feed).not_to include(Activity.broadcastables.where(user_id: user.id).first)
    end

    it 'should show followed users likeable activity' do
      expect(user.activity_feed).to include(Activity.likeables.where(user_id: followed_user.id).first)
    end
  end
end
