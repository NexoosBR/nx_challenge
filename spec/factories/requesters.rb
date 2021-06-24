FactoryBot.define do
  factory :requester do
    name { Faker::Name.name }
		cnpj { Faker::Company.brazilian_company_number(formatted: true) }
    phone { Faker::PhoneNumber.phone_number_with_country_code }
    email { Faker::Internet.email }
    commercial_address { Faker::Address.full_address }
    company_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
