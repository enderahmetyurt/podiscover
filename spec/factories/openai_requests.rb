FactoryBot.define do
  factory :openai_request do
    prompt { "MyText" }
    result { "MyText" }
    user_id { 1 }
    status { "MyText" }
  end
end
