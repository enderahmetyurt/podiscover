# frozen_string_literal: true

require "rails_helper"

RSpec.describe Maintenance::UpdateCategoriesTask, type: :task do
  it "#process performs a task iteration" do
    VCR.use_cassette("podcast_feed_response") do
      podcast = FactoryBot.create(:podcast, name: "Hello Test")

      Maintenance::UpdateCategoriesTask.process(podcast)

      expect(podcast.categories.count).to eq 1
    end
  end
end
