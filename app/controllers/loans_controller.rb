class LoansController < ApplicationController
  before_action :set_loan, only: [:show]
  
  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      render json: {'loan': {'id': @loan.id}}, status: :ok
    else
      render json: { "message": "Please check your params."}, status: :forbidden
    end
  end

  def show
    render json: @loan
  end

  private

  def loan_params
    params.require(:loan).permit(:value, :fee, :months)
  end

  def set_loan
    @loan = Loan.find(params[:id])
  end
end
