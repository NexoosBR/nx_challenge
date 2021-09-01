FactoryBot.define do
  factory :loan do
    present_value { Faker::Commerce.price }
    rate { rand(1..10)/100.to_f }
    period { rand(1..12) }
    amount { Faker::Commerce.price }
  end
end
