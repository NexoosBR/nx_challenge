class CreatePmtService
  def initialize(params = {})
    @taxa = params['taxa'].to_f
    @value = params['value'].to_f
    @quantity = params['quantity'].to_i
    @loan = params[:id] ? Loan.find(params[:id]) : nil
  end

  def create
    create_pmt
  end

  def format
    format_pmt
  end

  private

  def create_pmt
    juros = (@value * @taxa) * @quantity
    (@value + juros).round(2)
  end

  def format_pmt
    {
      pmt: @loan.pmt,
      quota: (@loan.pmt / @loan.quantity).round(2),
      quantity: @loan.quantity
    }
  end
end