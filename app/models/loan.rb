# frozen_string_literal: true

class Loan < ApplicationRecord
  validates :amount, presence: true
  validates :rate, presence: true
  validates :installments, presence: true

  validates :amount, numericality: { greater_than: 0 }
  validates :rate, numericality: { greater_than: 0 }
  validates :installments, numericality: { greater_than: 0 }

  def calculation_of_monthly_amortization
    pmt = (amount * rate / 100) / (1 - (1 + rate / 100)**-installments)
    pmt.round(2)
  end
end
