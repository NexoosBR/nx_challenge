class Loan < ApplicationRecord
  attribute :period_type, :integer, default: 0
  attribute :loan_start_date, :datetime, default: -> { DateTime.now.in_time_zone(Time.zone) }

  enum period_type: { monthly: 0, yearly: 1 }

  # Basic Validations
  validates :loan_amount, numericality: { greater_than: 0, less_than_or_equal_to: 999_999 }, presence: true
  validates :interest_rate, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, presence: true
  validates :period, numericality: { greater_than: 0, less_than_or_equal_to: 60, only_integer: true }, presence: true
  validates_datetime :loan_start_date, between: [DateTime.now.in_time_zone(Time.zone).to_date, 61.day.after]
  validates_numericality_of :period_type, only_integer: true

  belongs_to :client
  accepts_nested_attributes_for :client
end
