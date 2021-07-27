class Loan < ApplicationRecord
    belongs_to :client

    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :months, presence: true, numericality: { greater_than: 0 }
    validates :montly_rate_percent, presence: true, numericality: { greater_than: 0 }
end
