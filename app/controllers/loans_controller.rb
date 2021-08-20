class LoansController < ApplicationController
  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      render json: @loan, only: :id, status: :created
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  def show
    @loan = Loan.find(params[:id])
    
    render json: @loan, only: [:id, :pmt]
  end

  private
    def loan_params
      params.permit(:id, :value, :tax, :months)
    end
end
