FactoryBot.define do
  factory :loan do
    value {Faker::Number.decimal(l_digits: 2)}
    taxa  {Faker::Number.between(from: 0.1, to: 1.0)}
    pmt   { Faker::Number.decimal(l_digits: 2) }
  end
end