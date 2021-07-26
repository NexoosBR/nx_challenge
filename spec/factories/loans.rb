FactoryBot.define do
    factory :loan do
        financed_amount {3500} 
        rate {2.0}
        months {3}
        client_id {1}
    end
  end