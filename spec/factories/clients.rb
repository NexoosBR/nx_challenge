FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    cpf { Faker::Number.number(digits: 11) }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end