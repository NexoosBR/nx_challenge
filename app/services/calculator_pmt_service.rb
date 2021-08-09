class CalculatorPmtService
  def initialize(amount:, instalment_number:, tax:)
    @amount = amount
    @instalment_number = instalment_number
    @tax = tax
  end

  def call
    (amount * (tax * ( 1 + tax ) ** instalment_number) / (( 1 + tax ) ** instalment_number - 1)).round(2)
  end
  
  private

  attr_reader :amount, :instalment_number, :tax
end