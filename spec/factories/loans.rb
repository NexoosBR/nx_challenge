FactoryBot.define do
  factory :loan do
    amount { Faker::Number.decimal(l_digits: 2) }
    tax { Faker::Number.decimal(l_digits: 2) }
    time { Faker::Number.number(digits: 2) }
    pmt { Faker::Number.decimal(l_digits: 2) }
  end
end
