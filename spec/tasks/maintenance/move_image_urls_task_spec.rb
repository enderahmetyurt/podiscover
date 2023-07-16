# frozen_string_literal: true

require "rails_helper"

module Maintenance
  RSpec.describe MoveImageUrlsTask do
    it "shouldn't move images urls to a podcast extra field if the podcast has already" do
      podcast = FactoryBot.create(:podcast)

      Maintenance::MoveImageUrlsTask.process(podcast)

      expect(podcast.extras["image_urls"]).to eq(podcast.extras["image_urls"])
    end
  end
end
