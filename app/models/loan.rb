class Loan < ApplicationRecord
  validates :value, presence: true
  validates :taxa, presence: true

  def pmt
    n = 5.7479135963
    v = value
    t = taxa
    pmt = (v * (t * (1 + t) ** n)) / ((1 + t) ** n - 1)
    pmt.round
  end
end
