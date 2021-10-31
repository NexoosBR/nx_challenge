class Loan < ApplicationRecord

  validates :months, :amount, :fee, presence:true
  validates :months, :amount, :fee, numericality: { greater_than: 0 }

  def pmt_calculator
    amount * ( fee_value * ((1 + fee_value) ** months)) / (((1 + fee_value) ** months) - 1)
  end

  def fee_value
    (self.fee / 100)
  end
end
