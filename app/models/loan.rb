class Loan < ApplicationRecord
  before_create :calculate_installment

  belongs_to :customer

  validates :amount, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 999_999_999 }
  validates :monthly_rate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000 }
  validates :months, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 420 }

  private

  def calculate_installment
    self.installment = Loans::PmtCalculateService.call(
      amount: amount,
      monthly_rate: monthly_rate,
      months: months
    )
  end
end
