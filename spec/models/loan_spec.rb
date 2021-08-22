require 'rails_helper'

RSpec.describe Loan, type: :model do
  context 'validations' do
    it 'accepts a valid Loan' do
      loan = Loan.new(financed_amount: 1000, rate: 2, months: 12)
      expect(loan.save).to be(true)
    end

    it 'do not save if value for financed amount is equal to zero' do
      loan = Loan.new(financed_amount: 0, rate: 2, months: 12)
      expect(loan.save).to be(false)
    end

    it 'do not save if value for rate is equal to zero' do
      loan = Loan.new(financed_amount: 1000, rate: 0, months: 12)
      expect(loan.save).to be(false)
    end
  end
end
