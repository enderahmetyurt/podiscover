# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:spotify]

  has_many :podcasts

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end

    spotify_user = RSpotify::User.new(auth)
    podcasts = []
    response = nil
    i = 0

    until response.present?
      response = spotify_user.saved_shows(limit: 50, offset: 0)

      if response.present?
        podcasts += response
        i += 1
      else
        break
      end
    end

    podcasts.each do |podcast|
      next if user.podcasts.includes(:uid).find_by(uid: podcast.id).present?

      pp = Podcast.new(user_id: user.id)
      pp.name = podcast.name
      pp.description = podcast.description
      pp.uid = podcast.id
      pp.language = podcast.languages.first # TODO: make it an array
      pp.publisher = podcast.publisher
      pp.uri = podcast.uri
      pp.external_url = podcast.external_urls['spotify']

      pp.save!

      podcast.images.each do |image|
        ImageUrl.create(url: image['url'], height: image['height'], width: image['width'], podcast_id: pp.reload.id)
      end
    end

    user
  end
end
