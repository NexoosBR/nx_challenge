class Loan < ApplicationRecord

  validates_presence_of :monthly_fee, :financed_amount, :monthly_payments
  validates_numericality_of :monthly_fee, :financed_amount, :monthly_payments, greater_than: 0

  validates :monthly_payments, numericality: {only_integer: true}


  before_create :calculate_pmt

  private
  def calculate_pmt
    self.payments_value = financed_amount * (( monthly_fee * ((1 + monthly_fee) ** monthly_payments)) / (((1 + monthly_fee) ** monthly_payments) - 1))
  end
end
