require 'rails_helper'

RSpec.describe Podcast, type: :request do
  let(:podcast) { FactoryBot.create(:podcast) }
  
  describe '#show' do
    it 'supports :id' do
      get "/podcasts/#{podcast.id}"
    
      expect(response).to have_http_status(200)
      expect(response.body).to include podcast.name
    end

    it 'supports :id' do
      get "/podcasts/-1"
  
      expect(response).to have_http_status(200)
    end
  end
end