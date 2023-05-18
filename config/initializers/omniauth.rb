# frozen_string_literal: true

require "rspotify/oauth"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_SECRET_ID"], scope: "user-read-email user-library-read user-read-playback-position"
end
