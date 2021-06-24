class Loan < ApplicationRecord
  belongs_to :credit

  validates :amount, :tax, :term, presence: true
end
