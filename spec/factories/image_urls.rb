FactoryBot.define do
  factory :image_url do
    url { Faker::LoremFlickr.image }
    podcast
  end
end