FactoryBot.define do
  factory :loan do
    amount { 10_000 }
    monthly_rate { 0.02 }
    months { 12 }

    association :customer
  end
end
