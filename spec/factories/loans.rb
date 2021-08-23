FactoryBot.define do
  factory :loan do     
    trait :gerado do
      pv {Faker::Number.decimal(l_digits: 8, r_digits: 2)}
      taxa_mensal {Faker::Number.decimal(l_digits: 0, r_digits: 3)}
      meses {Faker::Number.decimal_part(digits: 2)}
    end

    trait :fixo do
      pv {999}
      taxa_mensal {0.028}
      meses {12}
    end

    cliente
  end
end