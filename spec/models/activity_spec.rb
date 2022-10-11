require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:podcast) { FactoryBot.create(:podcast) }
  let(:episode) { FactoryBot.create(:episode, podcast_id: podcast.id) }

  describe 'model consistency' do
    context 'user_id' do
      let(:likeable_activity) { Activity.new(activatable: Likeable.create(podcast_id: podcast.id, episode_id: episode.id), user_id: nil) }
      let(:new_user_has_created_broadcastable_activity) { Activity.create(activatable: Broadcastable.new(action: 'new_user_has_created'), user_id: nil) }
      let(:new_version_has_released_broadcastable_activity) { Activity.create(activatable: Broadcastable.new(action: 'new_version_has_released'), user_id: nil) }

      it 'is not required for new_version_has_released broadcastable activity' do
        expect(new_version_has_released_broadcastable_activity).to be_valid
      end

      it 'is required for likeable_activity' do
        expect(likeable_activity).not_to be_valid
        expect(likeable_activity.errors.full_messages).to include "User can't be blank"
      end

      it 'is required for new_user_has_created broadcastable activity' do
        expect(new_user_has_created_broadcastable_activity).not_to be_valid
        expect(new_user_has_created_broadcastable_activity.errors.full_messages).to include "User can't be blank"
      end
    end
  end
end
