class FixedLoanPaymentCalculatorService < ApplicationService

  attr_reader :loan

  def initialize(loan)
    @loan = loan
  end

  def call
    fixed_loan_payment_calculating
  end

  private

  def fixed_loan_payment_calculating
    interest_rate_percentage = (loan.interest_rate / 100.0)
    interest_rate_factor = (1 + interest_rate_percentage)**loan.period
    dividend = (loan.loan_amount * interest_rate_percentage) * interest_rate_factor
    divider = interest_rate_factor - 1
    (dividend / divider).round(2)
  end
end
