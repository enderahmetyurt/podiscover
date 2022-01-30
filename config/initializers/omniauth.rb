# frozen_string_literal: true

require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, 'd10599e1c55d4915b1278fda88a369a6', '59b84e7b2a8d408192d175991bd0c556',
           scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
