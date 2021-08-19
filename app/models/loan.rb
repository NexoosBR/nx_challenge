class Loan < ApplicationRecord
  before_create :calculate_pmt
  validates :value, :tax, :months, presence: true, numericality: { greater_than: 0 }

  def as_json(options={})
    options[:root] = true
    super(options)
  end

  def calculate_pmt
    self.pmt = (value * ((tax * ((1 + tax) ** months)) / (((1 + tax) ** months) - 1))).round(2)
  end
end
