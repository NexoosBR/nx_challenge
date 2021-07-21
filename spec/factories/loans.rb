FactoryBot.define do
  factory :loan do
    rate { 0.2 }
    months_period { 12 }
    value { 2000.0 }
    pmt { 450.00 }
  end
end
