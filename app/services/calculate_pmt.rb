require 'forwardable'

class CalculatePmt
  extend Forwardable

  def_delegators :loan, :monthly_fee, :number_of_months, :amount

  attr_reader :loan

  def initialize(loan)
    @loan = loan
  end

  def call
    pmt.round(2)
  end

  private

  def pmt
    amount * ( monthly_fee_percentage * ((1 + monthly_fee_percentage) ** number_of_months)) / (((1 + monthly_fee_percentage) ** number_of_months) - 1)
  end

  def monthly_fee_percentage
    monthly_fee / 100
  end
end