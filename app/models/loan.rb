class Loan < ApplicationRecord
  before_validation :pmt
 
 validates :rate, :value, :duration, presence: true
 
 validates :value, :rate, presence: true, numericality: { greater_than: 0 }
 validates :installments, numericality: { greater_than: 0 }
 
 
 private
 
 def pmt
   self.pmt = (self.value * self.rate / 100) / (1 - (1 + self.rate / 100)**-self.duration).roud(2)
 end

end
