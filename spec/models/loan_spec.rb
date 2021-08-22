require 'rails_helper'

RSpec.describe Loan, type: :model do
  context 'validations' do
    it 'accepts a valid Loan' do
      loan = Loan.new(financed_amount: 1000, rate: 2, months: 12)
      expect(loan.save).to be(true)
    end
  end
end
