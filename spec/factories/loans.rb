FactoryBot.define do
  factory :loan do
    loan_amount { Faker::Number.decimal(r_digits: 2, l_digits: 3) }
    interest_rate { Faker::Number.decimal(r_digits: 2, l_digits: 2) }
    period { Faker::Number.within(range: 1..60) }
    period_type { 0 }
    loan_start_date { DateTime.current.to_date }
    client
  end

  trait :loan_with_future_start_date do
    loan_start_date { 1.day.after }
  end

  trait :loan_with_past_start_date do
    loan_start_date { 1.day.before }
  end

  trait :simple_loan_payment do
    loan_amount { 10_000 }
    interest_rate { 2 }
    period { 12 }
  end
end
