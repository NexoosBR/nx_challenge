class Loan < ApplicationRecord
    validates :value, :rate, :installments, presence: true
    validates :value, :rate, :installments, numericality: { greater_than: 0 }
end
