FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    nickname { Faker::Name.initials }
  end
end
