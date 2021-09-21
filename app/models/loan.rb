class Loan < ApplicationRecord
  validates :value, :taxa, presence: true
  validates :value, :taxa, numericality: { greater_than: 0 }

  before_create :conversion_rate_to_percentage
  after_create :calculate_pmt

  private

  def conversion_rate_to_percentage
    self.taxa = taxa / 100
  end

  def calculate_pmt
    pmt = (value * taxa * (1 + taxa)**12) / (((1 + taxa)**12) - 1)
    update(pmt: pmt.ceil(2))
  end
end
