class Loan < ApplicationRecord
  attribute :fixed_loan_payment, :decimal

  enum period_type: { monthly: 0, yearly: 1 }

  # Basic Validations
  validates :loan_amount, numericality: { greater_than: 0, less_than_or_equal_to: 999_999 }, presence: true
  validates :interest_rate, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, presence: true
  validates :period, numericality: { greater_than: 0, less_than_or_equal_to: 60, only_integer: true }, presence: true
  validates_datetime :loan_start_date, between: [DateTime.now.in_time_zone(Time.zone).to_date, 61.day.after]
  validates_numericality_of :period_type, only_integer: true

  belongs_to :client
  accepts_nested_attributes_for :client

  def fixed_loan_payment
    FixedLoanPaymentCalculatorService.new(self).call
  end
end
