require 'rails_helper'

RSpec.describe Episode, :type => :model do
  it "should return uk flag when language is en" do
    episode = FactoryBot.create(:episode, language: 'en')
    expect(episode.language_emoji).to eq('🇬🇧')
  end

  it "should return uk flag when language includes en" do
    episode = FactoryBot.create(:episode, language: 'en-US')
    expect(episode.language_emoji).to eq('🇬🇧')
  end

  it "should return tr flag when language is tr" do
    episode = FactoryBot.create(:episode)
    expect(episode.language_emoji).to eq('🇹🇷')
  end

  it "should return earth flag when language is not supported" do
    episode = FactoryBot.create(:episode, language: 'fr')
    expect(episode.language_emoji).to eq('🌐')
  end
end
