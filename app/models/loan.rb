class Loan < ApplicationRecord
  validates :loan_amount, numericality: { greater_than: 0, less_than: BigDecimal(1000**3) }, presence: true
  validates :interest_rate, numericality: { greater_than: 0 }, presence: true
  validates :period, numericality: { greater_than: 0, less_than_or_equal_to: 60, only_integer: true }, presence: true
  validates :period_type, presence: true
  validates :loan_start_date, presence: true

  validates_datetime :loan_start_date, is_at: lambda { DateTime.current.to_date }

  validates_numericality_of :period_type, only_integer: true

  validates :client, presence: true

  belongs_to :client
end
