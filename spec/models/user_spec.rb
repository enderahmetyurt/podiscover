require "rails_helper"

RSpec.describe User, type: :model do
  describe "after create callbacks" do
    let(:user) { FactoryBot.create(:user) }

    it "should send new user email after a user created" do
      user
      expect(ActionMailer::Base.deliveries.last.to).to eq([ENV["ADMIN_EMAIL"]])
    end

    it "should create related broadcastable" do
      expect { user }.to change { Broadcastable.count }.by 1
      expect(user.activities.broadcastables).not_to be_empty
      expect(user.activities.first.broadcastable.action).to eq "new_user_has_joined"
    end
  end

  describe "slug vales" do
    let!(:user) { FactoryBot.create(:user, display_name: "John Doe") }
    let(:another_user) { FactoryBot.create(:user, display_name: "John Doe") }

    it "should be parameterized" do
      expect(user.slug).to eq "john-doe"
    end

    it "should have appended 4 character uid if nickname is used as a slug for a different user" do
      expect(user.nickname).to eq another_user.nickname
      expect(another_user.slug).to include "john-doe"
      expect(another_user.slug.split("john-doe-").last.size).to eq 4
    end
  end

  describe "#activity_feed" do
    let!(:podcast) { FactoryBot.create(:podcast) }
    let!(:episode) { FactoryBot.create(:episode, podcast_id: podcast.id) }
    let!(:user) { FactoryBot.create(:user) }
    let!(:followed_user) { FactoryBot.create(:user) }
    let!(:relationship) { Relationship.create(follower_id: user.id, followed_id: followed_user.id) }
    let!(:likeable_activity) { Activity.create(activatable: Likeable.new(podcast_id: podcast.id, episode_id: episode.id), user_id: followed_user.id) }
    let!(:new_user) { FactoryBot.create(:user) }

    it "should show new user's new_user_has_joined broadcastable activity" do
      activity = Activity.broadcastables.where(user_id: new_user.id).first

      expect(user.activity_feed).to include(activity)
      expect(activity.broadcastable.action).to eq "new_user_has_joined"
    end

    it "should not show to user its own new_user_has_joined broadcastable activity" do
      activity = Activity.broadcastables.where(user_id: user.id).first

      expect(user.activity_feed).not_to include(activity)
      expect(activity.broadcastable.action).to eq "new_user_has_joined"
    end

    it "should show followed user's likeable activity" do
      expect(user.activity_feed).to include(likeable_activity)
    end

    it "should create a followed activity when user starts to follow another user" do
      expect { user.follow(new_user) }.to change { Followable.where(action: "followed").count }.from(0).to(1)
    end

    it "should create an unfollowed activity when user stops to follow another user" do
      user.follow(new_user)
      expect { user.unfollow(new_user) }.to change { Followable.where(action: "unfollowed").count }.from(0).to(1)
    end
  end
end
