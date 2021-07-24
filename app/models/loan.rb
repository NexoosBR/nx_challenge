class Loan < ApplicationRecord
  enum period_type: { monthly: 0, yearly: 1 }

  # Basic Validations
  validates :loan_amount, numericality: { greater_than: 0, less_than_or_equal_to: 999_999 }, presence: true
  validates :interest_rate, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, presence: true
  validates :period, numericality: { greater_than: 0, less_than_or_equal_to: 60, only_integer: true }, presence: true
  validates :period_type, presence: true
  validates :loan_start_date, presence: true
  validates_datetime :loan_start_date, between: [DateTime.current.to_date, 1.day.after]
  validates_numericality_of :period_type, only_integer: true
  validates :client, presence: true

  belongs_to :client

  def fixed_loan_payment
    interest_rate_percentage = (interest_rate / 100.0)
    interest_rate_factor = (1 + interest_rate_percentage)**period
    dividend = (loan_amount * interest_rate_percentage) * interest_rate_factor
    divider = interest_rate_factor - 1
    (dividend / divider).round(2)
  end
end
