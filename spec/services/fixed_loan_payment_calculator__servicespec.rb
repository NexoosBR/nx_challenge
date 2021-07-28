require 'rails_helper'

RSpec.describe FixedLoanPaymentCalculatorService, type: :model do
  describe '#call' do
    let(:loan) { create(:loan) }

    it 'Calculanting Fixed Loan Payment (PMT) for a simple Loan' do
      fixed_loan_payment_value = FixedLoanPaymentCalculatorService.new(
        FactoryBot::build(:loan, :simple_loan_payment)
      ).call
      expect(fixed_loan_payment_value).to eq(945.60)
    end

    it 'Calculanting Fixed Loan Payment (PMT) for a complex Loan' do
      fixed_loan_payment_value = FixedLoanPaymentCalculatorService.new(
        FactoryBot::build(:loan, :complex_loan_payment)
      ).call
      expect(fixed_loan_payment_value).to eq(179.70)
    end
  end
end
