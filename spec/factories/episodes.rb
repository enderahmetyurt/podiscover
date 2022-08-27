FactoryBot.define do
  factory :episode do
    name { Faker::Lorem.sentence }
    html_description { Faker::Lorem.paragraph }
    language { 'tr'}
    release_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    duration_ms { Faker::Number.number(digits: 4) }
    podcast
  end
end