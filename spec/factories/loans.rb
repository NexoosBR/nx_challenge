# frozen_string_literal: true

FactoryBot.define do
  factory :loan, class: 'Loan' do
    value { 1000 }
    rate { 0.2 }
    months { 12 }
    association :client, factory: :client
  end
end
