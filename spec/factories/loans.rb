FactoryBot.define do
  factory :loan do
    value { 1000 }
    months { 12 }
    taxa { 0.2 }
  end
end
