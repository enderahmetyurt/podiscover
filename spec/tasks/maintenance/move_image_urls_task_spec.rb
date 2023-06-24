# frozen_string_literal: true

require "rails_helper"

module Maintenance
  RSpec.describe MoveImageUrlsTask do
    it "move imagas urls to a podcast extra field" do
      podcast = FactoryBot.create(:podcast)
      image_url = FactoryBot.create_list(:image_url, 3, podcast: podcast)

      Maintenance::MoveImageUrlsTask.process(podcast)

      expect(podcast.extras).not_to be_empty
      expect(podcast.extras["image_urls"].count).to eq(3)
      expect(podcast.extras["image_urls"].first["url"]).to eq(image_url.first.url)
    end
  end
end
