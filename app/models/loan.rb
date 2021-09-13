class Loan < ApplicationRecord
  #validation of the fields below
  validates :value, presence: true
  validates :months, presence: true
  validates :tax, presence: true
  validates :pmt, presence: true


  def pmt
    # the VALUE variable is the amount to be financed.TAX is the monthly fee and MONTHS is the installment time
    tax = self.tax/100
    if tax <= 0
      errors.add :base, " 'tax:' invalid field value"
    else
      self.pmt = (value * ((tax * ((1 + tax) ** months)) / (((1 + tax) ** months) - 1))).round(2)
    end
  end

end
