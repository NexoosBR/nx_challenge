FactoryBot.define do
  factory :loan do
    loan_amount { "9.99" }
    interest_rate { 1.5 }
    period { 1 }
    period_type { 1 }
    loan_start_date { "2021-07-22 18:00:54" }
    client { nil }
  end
end
