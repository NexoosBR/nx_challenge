class Loan < ApplicationRecord
    validades :present_value, presence: true, numericality: { greater_than: 0 }
    validades :periods, presence: true, numericality: { greater_than: 0 }
    validades :rate, presence: true, numericality: { greater_than: 0 }
    validates :pmt, presence: true
    
end
