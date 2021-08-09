class Loan < ApplicationRecord
    validates :total_value, :monthly_fee, :number_of_months, presence: true
    validates :number_of_months, numericality: { only_integer: true }
    validates :monthly_fee, numericality: { less_than_or_equal_to: 1.0 }

    before_create do
        value = (total_value * ((monthly_fee * (1 + monthly_fee) ** number_of_months) / (((1 + monthly_fee) ** number_of_months) - 1)))
        self.pmt = value
    end
end