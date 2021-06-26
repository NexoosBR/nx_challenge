# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'CRIANDO REQUESTER'
5.times  do
	Requester.create({
		name: Faker::Book.title,
		cnpj: Faker::Company.brazilian_company_number(formatted: true),
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    email: Faker::Internet.email,
    commercial_address: Faker::Address.full_address,
    company_birth: Faker::Date.birthday(min_age: 18, max_age: 65)
	})
end

puts 'CRIANDO CRÉDITO'
5.times do
  Credit.create({
    amount: Faker::Number.decimal(l_digits: 2),
    credit_at: Faker::Date.in_date_period,
    accept: 's',
    requester_id: FactoryBot.create(:requester).id
  })
end

puts 'CRIANDO EMPRÉSTIMO'
5.times do
  Loan.create({
    amount: Faker::Number.decimal(l_digits: 2),
    tax: Faker::Number.decimal(l_digits: 1, r_digits: 2),
    term: Faker::Number.non_zero_digit,
    credit_id: FactoryBot.create(:credit).id
  })
end
