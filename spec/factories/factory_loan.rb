FactoryBot.define do
  factory :loan do
    valor { 200.0 }
    taxa { 2.0 }
    nprestacoes { 4 }
    pmt { nil }
  end
end