require 'faker'
puts 'Seeding clients with loans'

40.times.each do
  client = Client.find_or_create_by!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    nickname: Faker::Name.initials
  )
  rand(1..10).times.each do
    Loan.find_or_create_by!(
      loan_amount: Faker::Number.decimal(r_digits: 2, l_digits: 3),
      interest_rate: Faker::Number.decimal(r_digits: 2, l_digits: 2),
      period: Faker::Number.within(range: 1..60),
      loan_start_date: DateTime.now.in_time_zone(Time.zone),
      client: client
    )
  end
end
