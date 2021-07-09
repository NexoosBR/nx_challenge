FactoryBot.define do
  factory :customer do
    document { FFaker::IdentificationBR.pretty_cnpj }
    full_name { FFaker::Company.name }
  end
end
