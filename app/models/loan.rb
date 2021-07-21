class Loan < ApplicationRecord
  validates :value, :rate, :months_period, presence: :true  
  validates :months_period, numericality: { only_integer: true, greater_than: 0 }
  validates :value, numericality: { greater_than: 0 }
  validates :rate, numericality: { greater_than: 0 }

  def call_pmt_calculation
    pmt_calculation
  end

  private

  def pmt_calculation
    self.pmt = self.value * ((self.rate * (1 + self.rate) ** self.months_period)) / (((1 + self.rate) ** self.months_period) - 1)
  end
end
