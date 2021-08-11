class Loan < ApplicationRecord
    validates :months, presence: true, numericality: { greater_than: 0 }
    validates :value, presence: true, numericality: { greater_than: 0 }
    validates :fee, presence: true, numericality: { greater_than: 0 }

    before_create do
        i = fee.to_f/100
        result = value*((i*(1+i)**months)/(((1+i)**months) - 1))
        self.pmt = result.round(2)
    end
end
