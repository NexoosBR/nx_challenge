class Loan < ApplicationRecord
    validates :present_value, presence: true, numericality: { greater_than: 0 }
    validates :periods, presence: true, numericality: { greater_than: 0 }
    validates :rate, presence: true, numericality: { greater_than: 0, less_than: 1 }
    
    before_create do
        result = present_value * (( rate * ((1 + rate) ** periods)) / (((1 + rate) ** periods) - 1))
        self.pmt = result.round(2)
    end 
end
