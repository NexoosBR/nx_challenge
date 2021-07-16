# frozen_string_literal: true

FactoryBot.define do
  factory :loan do
    value { 1000 }
    installments { 5 }
    rate { 0.02 }

    trait :invalid do
      value { 0 }
      installments { 0 }
      rate { 0 }
    end
  end
end
