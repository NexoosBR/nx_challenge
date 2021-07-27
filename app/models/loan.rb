class Loan < ApplicationRecord
  validates :amount, :number_of_months, :monthly_fee, :client_id, presence: true

  belongs_to :client
end
