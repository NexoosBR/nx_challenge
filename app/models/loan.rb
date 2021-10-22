class Loan < ApplicationRecord
  validates :value, presence: true,numericality: true
  validates :taxa, presence: true,numericality: true
end
