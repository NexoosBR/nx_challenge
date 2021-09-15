class Loan < ApplicationRecord
    validates :value, :rate, :installments, presence: true
    validates :value, :rate, :installments, numericality: { greater_than: 0 }

    def pmt 
        power = ( 1 + self.rate ) ** self.installments
        pmt = self.value/((power - 1)/ (power * self.rate))
        pmt.to_f
    end
    
end
