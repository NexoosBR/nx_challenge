class Loan < ApplicationRecord
  Pmt = lambda { |v, r, m|
    v.to_f * ((((1 + r.to_f)**m) * r.to_f) / (((1 + r.to_f)**m) - 1))
  }

  validates :value, :months, :rate, presence: true
  validates :value, :months, :rate, numericality: { greater_than: 0 }

  before_save :calc_pmt

  def calc_pmt
    self.pmt = Pmt.call(value, rate, months).to_f.round(2)
  end
end
