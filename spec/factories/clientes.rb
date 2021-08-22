FactoryBot.define do
  factory :cliente do
    nome { Faker::Name.name }
    email { Faker::Internet.email }
    cpf { Faker::Number.number(digits: 11).to_s }
    telefone { Faker::PhoneNumber.phone_number }
  end
end