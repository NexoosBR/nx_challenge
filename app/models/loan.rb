class Loan < ApplicationRecord
  validates :months, numericality: { greater_than: 0, only_integer: true }
  validates :monthly_tax, numericality: { greater_than: 0 }
  validates :amount, numericality: { greater_than_or_equal_to: 0.01 }

  before_create :calculate_pmt


  private

  def calculate_pmt
    if self.valid?
      self.pmt = PmtService.calculate(amount: amount,
                                      monthly_tax: monthly_tax,
                                      months: months)
    end
  end

end
