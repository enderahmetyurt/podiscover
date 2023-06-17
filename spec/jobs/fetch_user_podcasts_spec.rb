# frozen_string_literal: true

require "rails_helper"

RSpec.describe FetchUserPodcasts, type: :job do
  it "should fetch a given user podcasts and their images" do
    auth = {
      "provider" => "spotify",
      "uid" => "test123",
      "info" =>
       {"display_name" => "test123",
        "email" => "test@test.com",
        "external_urls" => {"spotify" => "https://open.spotify.com/user/test123"},
        "followers" => {"href" => "", "total" => "100"},
        "href" => "https://api.spotify.com/v1/users/test123",
        "id" => "test123",
        "images" => [{"height" => "", "url" => "https://i.scdn.co/image/XXyy123", "width" => ""}],
        "type" => "user",
        "uri" => "spotify:user:test123"},
      "credentials" =>
       {"token" => "aaaaa",
        "refresh_token" => "BBBB",
        "expires_at" => "1686990799",
        "expires" => "true"},
      "extra" => {}
    }

    user = FactoryBot.create(:user, email: "test@test.com")

    VCR.use_cassette("user_saved_shows_response") do
      expect(user.podcasts.count).to eq(0)

      FetchUserPodcasts.new.perform(user.id, auth)
      podcast = user.podcasts.first

      expect(user.podcasts.count).to eq(42)
      expect(podcast.image_urls.count).to eq(3)
      expect(podcast.image_urls.second.url).to eq("https://i.scdn.co/image/ab67656300005f1f950861e86b6884fcf8e458b6")
    end
  end
end
