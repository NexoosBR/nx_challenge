FactoryBot.define do
  factory :loan do
    amount { Faker::Number.decimal(l_digits: 2) }
    tax { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    term { Faker::Number.non_zero_digit }
    credit_id { FactoryBot.create(:credit).id }
  end
end
