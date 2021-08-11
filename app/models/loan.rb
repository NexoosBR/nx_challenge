class Loan < ApplicationRecord
    validates :months, presence: true, numericality: { greater_than: 0 }
    validates :value, presence: true, numericality: { greater_than: 0 }
    validates :fee, presence: true, numericality: { greater_than: 0 }

    before_create do
        result = value*((fee*(1+fee)**months)/(((1+fee)**months) - 1))
        self.pmt = result.round(2)
    end
end
