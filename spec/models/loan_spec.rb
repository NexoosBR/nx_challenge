require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { is_expected.to validate_presence_of :value }
  it { is_expected.to validate_presence_of :tax }
  it { is_expected.to validate_presence_of :months }

  it { is_expected.to validate_numericality_of(:value).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:tax).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_numericality_of(:months).is_greater_than(0) }

  describe 'calculate pmt' do
    context 'when all values are prensent' do
      it 'return the calculated value' do
        loan = Loan.create(value: 1000, tax: 1, months: 12)
        expect(loan.pmt.to_f).to eq 88.85
      end
    end

    context 'when the months quantity is one' do
      it 'return the calculated value' do
        loan = Loan.create(value: 89, tax: 1.3, months: 1)
        expect(loan.pmt.to_f).to eq 90.16
      end
    end

    context 'when the value is zero' do
      it 'return zero' do
        loan = Loan.create(value: 0, tax: 1, months: 12)
        expect(loan.pmt.to_f).to eq 0
      end
    end

    context 'when the tax is zero' do
      it 'return the calculated value' do
        loan = Loan.create(value: 600, tax: 0, months: 6)
        expect(loan.pmt.to_f).to eq 100
      end
    end

    context 'when the months is zero' do
      it 'return zero' do
        loan = Loan.create(value: 30, tax: 2, months: 0)
        expect(loan.pmt.to_f).to eq 0
      end
    end
  end
end
