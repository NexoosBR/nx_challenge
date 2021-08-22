class Loan < ApplicationRecord
  validates :financed_amount, :rate, :months, :pmt, presence: true, numericality: { greater_than: 0 }

  before_validation :ensure_pmt_has_a_value

  private

  def ensure_pmt_has_a_value
    i = rate.to_f / 100
    self.pmt = (financed_amount * ((i * (1 + i)**months) / ((1 + i)**months - 1))).round(2)
  end
end
