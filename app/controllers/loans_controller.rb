class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      render json: {loan: {id: @loan.id}}, status: :created
    else
      render json:  @loan.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: {loan: {id: @loan.id, pmt: @loan.payments_value}}
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.permit(:financed_amount, :monthly_fee, :monthly_payments)
  end

end
