class Loan < ApplicationRecord
  before_save :set_pmt

  private

  # Callback para definir a pmt
  def set_pmt
    value = self.value
    fee = self.fee
    months = self.months
    self.pmt = Pmt::Calculator.call(value, fee, months).round(2)
  end
end
