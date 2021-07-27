class Loan < ApplicationRecord
    belongs_to :client

    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :months, presence: true, numericality: { greater_than: 0 }
    validates :montly_rate_percent, presence: true, numericality: { greater_than: 0 }

    before_create :calculate_pmt

    def calculate_pmt
        rate = montly_rate_percent / 100.0

        self.pmt = amount * ( rate * ((1 + rate) ** months)) / (((1 + rate) ** months) - 1)
    end
end
