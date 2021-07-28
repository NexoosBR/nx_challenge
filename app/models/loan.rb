class Loan < ApplicationRecord
  attribute :fixed_loan_payment, :decimal

  # Basic Validations
  validates :loan_amount, numericality: { greater_than: 0, less_than_or_equal_to: 999_999 }, presence: true
  validates :interest_rate, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, presence: true
  validates :period, numericality: { greater_than: 0, less_than_or_equal_to: 60, only_integer: true }, presence: true

  belongs_to :client
  accepts_nested_attributes_for :client

  def fixed_loan_payment
    FixedLoanPaymentCalculatorService.new(self).call
  end
end
