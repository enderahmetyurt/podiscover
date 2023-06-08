FactoryBot.define do
  factory :episode_image_url do
    url { Faker::LoremFlickr.image }
    episode
  end
end