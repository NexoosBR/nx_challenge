class Loan < ApplicationRecord
  validates :value, :installments, :rate, presence: true
  validates :installments, numericality: { only_integer: true, greater_than: 0 }
  validates :value, numericality: { greater_than: 0, less_than: 9_999_999_999.99 }
  validates :rate, numericality: { greater_than: 0, less_than: 99.99 }

  before_create :set_pmt

  private

  def set_pmt
    self.pmt = value * ((rate * (1 + rate) ** installments) / ((1 + rate) ** installments - 1))
  end
end
