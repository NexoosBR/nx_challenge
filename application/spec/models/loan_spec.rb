require 'rails_helper'

RSpec.describe Loan, type: :model do
  it 'pmt' do
    loan = build(:loan)
    expect(loan.pmt).to eq(2334.7641675073237)
  end

  context 'when is invalid' do
    it 'rate is zero' do
      loan = build(:loan)
      loan.rate = 0
      expect(loan.valid?).to eq(false)
    end

    it 'installments is zero' do
      loan = build(:loan)
      loan.installments = 0
      expect(loan.valid?).to eq(false)
    end
  end

end
