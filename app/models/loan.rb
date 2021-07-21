class Loan < ApplicationRecord
    belongs_to :client

    validates :value, presence: true
    validates :client, presence: true
    validates :months, presence: true
    validates :rate, presence: true

    validates :value, numericality: {greater_than: 0}
    validates :months, numericality: {greater_than: 0}
    validates :rate, numericality: {greater_than_or_equal: 0}

    def pmt
        (value * ((rate * ((1 + rate) ** months)) / ((1 + rate) ** months - 1))).round(2).to_f
    end
end
