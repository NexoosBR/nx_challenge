class Loan < ApplicationRecord
  validates :value, :rate, :months_period, presence: :true  
  validates :months_period, numericality: { only_integer: true, greater_than: 0 }
  validates :value, numericality: { greater_than: 0 }
  validates :rate, numericality: { greater_than: 0 }
end
