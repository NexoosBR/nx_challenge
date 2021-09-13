class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  # GET /loans/id
  def show
    render json: @loan, only: [:id, :pmt] #returns only two fields
  end

  # POST /loans
  def create

    @loan = Loan.new(loan_params)

    if @loan.save
      render json: @loan, only: [:id ]
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end


  private

  def set_loan
    @loan = Loan.find(params[:id])
  end


  def loan_params
    params.require(:loan).permit(:value, :tax, :months, :pmt)
  end
end
