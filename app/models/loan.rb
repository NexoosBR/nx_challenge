class Loan < ApplicationRecord
  validates :value, :tax, :months, presence: true, numericality: { greater_than: 0 }

  def as_json(options={})
    options[:root] = true
    super(options)
  end

  def pmt
    (value * ((tax * ((1 + tax) ** months)) / (((1 + tax) ** months) - 1))).round(2)
  end
end
