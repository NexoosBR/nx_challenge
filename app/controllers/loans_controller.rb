class LoansController < ApplicationController
  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      render json: @loan
    else
      render json: @loan.errors
    end
  end

  def show
    @loan = Loan.find(params[:id])
    render json: @loan 
  end

  private
    def loan_params
      params.require(:loan).permit(:amount, :months, :rate, :client_id)
    end
end
