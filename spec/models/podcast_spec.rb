require "rails_helper"

RSpec.describe Podcast, type: :model do
  it "should return podcasts by query" do
    podcast = FactoryBot.create(:podcast, name: "Good morning Vietnam", description: "Cool podcast ever", publisher: "Robin Willams")
    podcast2 = FactoryBot.create(:podcast, name: "Üretim bandı", description: "Talk about good products", publisher: "Eran")
    podcast3 = FactoryBot.create(:podcast, name: "Fika time", description: "Coffee and cake time", publisher: "Good2")

    result = Podcast.search("good")

    expect(result.count).to eq(3)
    expect(result).to include podcast, podcast2, podcast3
  end
end
