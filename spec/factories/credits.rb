FactoryBot.define do
  factory :credit do
    amount { Faker::Number.decimal(l_digits: 2) }
    credit_at { Faker::Date.in_date_period }
    accept { 's' }
    requester_id { FactoryBot.create(:requester).id }
  end
end
