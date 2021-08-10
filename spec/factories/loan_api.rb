FactoryBot.define do
  factory :loan_expected_attributes_hash, class: Hash do
    due_date { Date.parse("10/10/2020") }
    instalment_number { "3" }
    amount { "1000" }
    tax { "0.02" }

    initialize_with { attributes }
  end

  factory :loan_invalid_expected_attributes_hash, class: Hash do
    instalment_number { "3" }
    amount { "1000" }
    tax { "0.02" }

    initialize_with { attributes }
  end
end