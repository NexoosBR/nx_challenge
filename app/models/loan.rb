class Loan < ApplicationRecord
  validates :due_date, :period_type, :amount, presence: true
end
