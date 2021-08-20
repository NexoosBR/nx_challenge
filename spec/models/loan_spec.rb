# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:rate) }
    it { is_expected.to validate_presence_of(:installments) }

    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:rate).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:installments).is_greater_than(0) }
  end

  describe '.calculation_of_monthly_amortization' do
    expected_values = [
      { amount: 1000, rate: 1, installments: 12, pvm: 88.85 },
      { amount: 20, rate: 6, installments: 3, pvm: 7.48 },
      { amount: 890, rate: 50, installments: 7, pvm: 472.66 }
    ]

    expected_values.each do |val|
      it "returns #{val[:pvm]} when amount is #{val[:amount]}, rate is #{val[:rate]}, installments is #{val[:installments]}" do
        result = described_class.new(amount: val[:amount], rate: val[:rate], installments: val[:installments])

        expect(result.calculation_of_monthly_amortization.to_f).to eq(val[:pvm])
      end
    end
  end
end
