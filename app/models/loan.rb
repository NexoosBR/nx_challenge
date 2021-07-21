class Loan < ApplicationRecord
  belongs_to :customer
  has_many :installments

  validates :total_value, presence: true
  validates :total_installment, presence: true
end
