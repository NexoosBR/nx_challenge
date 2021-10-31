class LoansController < ApplicationController

  def show
    @loan = Loan.find(params[:id])
    render json: {loan: {id: @loan.id, pmt_calculator: (@loan.pmt_calculator.round(2)).to_f }}
  end

  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      render json: { loan: { id: @loan.id } }, status: :created
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:months, :amount, :fee)
  end 
end
