# frozen_string_literal: true

class Loan < ApplicationRecord

    Pmt = lambda { |a, r, i|
      (a * r / 100) / (1 - (1 + r / 100)**-i)
    }
    
    validates :amount, presence: true
    validates :amount, :installments, numericality: { greater_than: 0 }
    
    before_save :calc_pmt
  
    def calc_pmt
      self.pmt = Pmt.call(amount, rate, installments).to_f.round(2)
      pmt.round(2)
    end
  end
  