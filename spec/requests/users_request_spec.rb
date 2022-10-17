require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe Episode, type: :request do
  let(:user) { FactoryBot.create(:user) }

  before { sign_in user }

  describe '#index' do
    it do
      get users_path

      expect(response).to have_http_status(200)
      expect(response.body).to include 'Community'
    end
  end

  describe '#show' do
    it do
      get "/users/#{user.slug}"

      expect(response).to have_http_status(200)
      expect(response.body).to include user.display_name
    end
  end

  describe '#following' do
    it do
      get "/users/#{user.slug}/following"

      expect(response).to have_http_status(200)
      expect(response.body).to include 'Following'
    end
  end

  describe '#followers' do
    it do
      get "/users/#{user.slug}/followers"

      expect(response).to have_http_status(200)
      expect(response.body).to include 'Follower'
    end
  end

  describe '#email_confirmation' do
    it do
      get "/users/#{user.slug}/email_confirmation"

      expect(response).to have_http_status(200)
      expect(response.body).to include "Create an account for Podiscover"
      expect(response.body).to include user.email
    end
  end

  describe '#allow_email_confirmation' do
    it do
      post "/users/#{user.slug}/allow_email_confirmation"

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(subscriptions_path)
      expect(user.reload.allow_email_usage_at).not_to be nil
      expect(user.tmp_email).to be nil
    end
  end

  describe '#deny_email_confirmation' do
    it do
      post "/users/#{user.slug}/deny_email_confirmation"

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(subscriptions_path)
      expect(user.reload.allow_email_usage_at).to be nil
      expect(user.tmp_email).not_to be nil
    end
  end
end
