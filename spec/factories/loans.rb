FactoryBot.define do
  @today = DateTime.current
  factory :loan do
    loan_amount { Faker::Number.decimal(r_digits: 2) }
    interest_rate { Faker::Number.decimal(r_digits: 2) }
    period { Faker::Number.within(range: 1..60) }
    period_type { [0, 1].sample }
    loan_start_date { @today }
    client
  end

  trait :loan_with_future_start_date do
    loan_start_date { 1.day.after }
  end

  trait :loan_with_past_start_date do
    loan_start_date { 1.day.before }
  end
end
