FactoryBot.define do
  factory :loan do
    loan_amount { Faker::Number.decimal(r_digits: 2, l_digits: 3) }
    interest_rate { Faker::Number.decimal(r_digits: 2, l_digits: 2) }
    period { Faker::Number.within(range: 1..60) }
    client
  end

  trait :simple_loan_payment do
    loan_amount { 10_000 }
    interest_rate { 2 }
    period { 12 }
  end

  trait :complex_loan_payment do
    loan_amount { 10_000.568 }
    interest_rate { 0.25 }
    period { 60 }
  end
end
