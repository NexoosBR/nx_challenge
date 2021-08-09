class Loan::CalculatorPmt
  def initialize(amount:, instalment_number:, tax:)
    @amount = amount
    @instalment_number = instalment_number
    @tax = tax
  end

  private

  attr_reader :amount, :instalment_number, :tax
end