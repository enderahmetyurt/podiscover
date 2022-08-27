FactoryBot.define do
  factory :podcast do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    language { 'tr'}
    publisher { Faker::Name }
  end
end