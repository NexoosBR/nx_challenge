class Loan < ApplicationRecord
  before_save :set_amount

  # Validates
  validates :present_value, :rate, :period, presence: true, numericality: { greater_than: 0 }

  # Methods Public
  def amount
    present_value * ((((1 + rate / 100)**period) * rate / 100) / (((1 + rate / 100)**period) - 1))
  end

  # Methods Private
  private

  def set_amount
    self[:amount] = amount
  end
end
