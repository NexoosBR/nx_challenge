class Loan < ApplicationRecord
  validates :value, presence: true
  validates :rate, presence: true
  validates :value, numericality: { greater_than: 0 }
  validates :rate, numericality: { greater_than: 0 }

  def calculate_pmt
    xrate = rate/100.to_f
    divisor =  value*xrate*(1+xrate)**installments
    dividendo = (1+xrate)**installments - 1
    pmt = (divisor/dividendo).round(2)
    pmt
  end
end
