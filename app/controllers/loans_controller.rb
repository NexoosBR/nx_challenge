class LoansController < ApplicationController
  def create
    @loan = Loan.new(
      value: params[:value],
      fee: params[:fee],
      months: params[:months]
    )
    if @loan.save
      render json: {loan: {id: @loan.id}}, status: :created
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  def show
    @loan = Loan.find(params[:id])
    render json: {loan: {id: @loan.id, pmt: @loan.pmt}}
  end
end
