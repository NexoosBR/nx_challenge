FactoryBot.define do
    factory :loan do 
        value { 30_000 }
        rate { 0.02 }
        installments { 15 }
    end
end