class Loan < ApplicationRecord
  validates :quantity, :taxa, :value, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :taxa, numericality: { greater_than_or_equal_to: 0.00, less_than_or_equal_to: 1.00 }
  validates :value, numericality: true
  validates :pmt, numericality: true, unless: Proc.new { |l| l.pmt.blank? }
end
