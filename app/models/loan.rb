class Loan < ApplicationRecord
  before_save :set_pmt

  private

  def set_pmt
    value = self.value
    fee = self.fee
    months = self.months
    self.pmt = Pmt::Calculator.call(value, fee, months).round(2)
  end
end
