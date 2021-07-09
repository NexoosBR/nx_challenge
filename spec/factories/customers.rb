FactoryBot.define do
  factory :customer do
    document { FFaker::IdentificationBR.pretty_cnpj }
    full_name { FFaker::Company.name }

    trait :with_loan do
      after(:create) do |customer|
        create(:loan, customer: customer)
      end
    end
  end
end
