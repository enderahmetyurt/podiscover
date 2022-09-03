FactoryBot.define do
  factory :likeable do
    podcast_id { 1 }
    episode_id { 1 }
    action { "MyString" }
  end
end
