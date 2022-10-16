FactoryBot.define do
  factory :followable do
    follower_id { 1 }
    followed_id { 1 }
    action { "MyString" }
  end
end
