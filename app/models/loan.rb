class Loan < ApplicationRecord
  validates :due_date, :period_type, :amount, presence: true
  before_save :calculate_pmt

  private
  
  def calculate_pmt
    self.pmt = CalculatorPmtService.new(amount: amount, instalment_number: instalment_number, tax: tax).call
  end
end
