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

  describe "#search" do
    it "returns podcast by query" do
      podcast = FactoryBot.create(:podcast, name: "Good morning Vieatnam")

      get "/podcasts/search?query=good"

      expect(response).to have_http_status(200)
      expect(response.body).to include podcast.name
    end

    it "show no podcast found message if any podcast not found by query" do
      get "/podcasts/search?query=fasdf"

      expect(response).to have_http_status(200)
      expect(response.body).to include "No podcasts found"
    end

    it "shows all podcasts without query" do
      podcast1 = FactoryBot.create(:podcast, name: "Good morning Vieatnam")
      podcast2 = FactoryBot.create(:podcast, name: "Fika time!")
      get "/podcasts/search"

      expect(response).to have_http_status(200)
      expect(response.body).to include podcast1.name
      expect(response.body).to include podcast2.name
    end
  end
end
