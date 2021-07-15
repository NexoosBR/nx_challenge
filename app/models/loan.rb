class Loan < ApplicationRecord
  belongs_to :customer
  has_many :installments
end
