FactoryBot.define do
  factory :podcast do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    language { Faker::Address.country_code }
    publisher { Faker::Name.first_name_neutral }
    extras { {image_urls: [{url: Faker::LoremFlickr.image}, {url: Faker::LoremFlickr.image}, {url: Faker::LoremFlickr.image}]} }
  end
end
