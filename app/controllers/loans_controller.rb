class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  def show
    render json: @loan
  end

  
  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      render json: @loan, status: :created, location: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  private
   
    def set_loan
      @loan = Loan.find(params[:id])
    end

    def loan_params
      params.require(:loan).permit(:rate, :value, :duration, :pmt)
    end
end
