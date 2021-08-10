class SaveLoanService
  def initialize(params:)
    @params = params.deep_symbolize_keys
    params[:due_date] = Date.parse(params[:due_date]) if params[:due_date].present?
  end

  def call
    loan = Loan.new(params)
    loan.save
    loan
  end

  private
  
  attr_reader :params
end