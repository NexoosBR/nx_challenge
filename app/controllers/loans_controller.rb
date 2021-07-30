class LoansController < ApplicationController
  before_action :get_loan, only: [:show]

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      json_response({loan: {id: @loan.id }})
    else
      json_response @loan.errors, :unprocessable_entity
    end
  end

  def show; end

  private

  def get_loan
  	@loan = Loan.find(params[:id])
  end

  def loan_params
    params.permit(:months, :monthly_tax, :amount)
  end
end
