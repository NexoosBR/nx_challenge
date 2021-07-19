class Loan < ApplicationRecord
  validates :value, :months, :taxa, presence: true
  validates :value, numericality: { greater_than: 0 }
  validates :months, numericality: { only_integer: true, greater_than: 0 }
  validates :taxa, numericality: { greater_than: 0, less_than: 1 }

  before_create :set_pmt

  def set_pmt
    self.pmt = value * ((taxa * (1 + taxa) ** months) / ((1 + taxa) ** months - 1))
  end
end
