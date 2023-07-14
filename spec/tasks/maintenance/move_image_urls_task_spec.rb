# frozen_string_literal: true

require "rails_helper"

module Maintenance
  RSpec.describe MoveImageUrlsTask do
    it "move images urls to a podcast extra field" do
      podcast = FactoryBot.create(:podcast)

      image_url = FactoryBot.create_list(:image_url, 3, podcast: podcast)

      Maintenance::MoveImageUrlsTask.process(podcast)

      expect(podcast.extras).not_to be_empty
      expect(podcast.extras["image_urls"].count).to eq(3)
      expect(podcast.extras["image_urls"].first["url"]).to eq(image_url.first.url)
    end

    it "shouldn't move images urls to a podcast extra field if the podcast has already" do
      podcast = FactoryBot.create(:podcast)

      Maintenance::MoveImageUrlsTask.process(podcast)

      expect(podcast.extras["image_urls"]).to eq(podcast.extras["image_urls"])
    end
  end
end
