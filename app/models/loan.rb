class Loan < ApplicationRecord

    validates_presence_of :amount, :tax, :time, :pmt
end
