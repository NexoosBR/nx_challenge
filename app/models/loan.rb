class Loan < ApplicationRecord
  before_create :conversion_rate_to_percentage
  after_create :calculate_pmt

  validates :value, :rate, presence: true
  validates :value, :rate, numericality: { greater_than: 0 }

  private

  def conversion_rate_to_percentage
    self.rate = rate / 100
  end

  def calculate_pmt
    pmt = (value * rate * (1 + rate)**12) / (((1 + rate)**12) - 1)
    update(pmt: pmt.ceil(2))
  end
end
