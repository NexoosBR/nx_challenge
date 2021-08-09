class Loan < ApplicationRecord
  validates :due_date, :period_type, :amount, presence: true
  befora_save :calculate_pmt

  private
  
  def calculate_pmt
    self.pmt = CalculatorPmt.new(amount: amount, instalment_number: instalment_number, tax: tax)
  end
end
