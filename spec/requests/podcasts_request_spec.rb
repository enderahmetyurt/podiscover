require "rails_helper"

RSpec.describe Podcast, type: :request do
  let(:user) { FactoryBot.create(:user) }

  before { sign_in user }

  describe "#show" do
    it "returns 200 when a podcast exists" do
      podcast = FactoryBot.create(:podcast)

      get "/podcasts/#{podcast.id}"

      expect(response).to have_http_status(200)
      expect(response.body).to include podcast.name
    end

    it "returns 302 when a podcast does not exists" do
      get "/podcasts/12"

      expect(response).to have_http_status(302)
    end
  end
end
