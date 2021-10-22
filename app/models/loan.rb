class Loan < ApplicationRecord
  validates :value, presence: true
  validates :taxa, presence: true
end
