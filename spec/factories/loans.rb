# frozen_string_literal: true

FactoryBot.define do
  factory :loan do
    present_value { "9.99" }
    tax { "0.2" }
    payments { "9.99" }
    time { 1 }
  end
end
