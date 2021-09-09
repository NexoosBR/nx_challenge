class Loan < ApplicationRecord
    before_validation :pmt
    validates :value, :tax, presence: true

    PERIOD = 12

    def pmt
        (self.value * ( set_tax_monthly_percentage * ((1 + set_tax_monthly_percentage) ** PERIOD)) / (((1 + set_tax_monthly_percentage) ** PERIOD) - 1)).ceil(2)
    end

    def set_tax_monthly_percentage
        (self.tax / 100)
    end
    
end