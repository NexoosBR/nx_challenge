FactoryBot.define do
  factory :loan do
    amount { 2500 }
    number_of_months { 5 }
    monthly_fee { 1.5 }
    client
  end
end