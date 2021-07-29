class LoansController < ApplicationController
  def create
    loan = Loan.new(loan_params)

    if loan.save
      render json: loan.as_json
    else
      render json: { errors: loan.errors, status: :unprocessed }
    end
  end

  def show
    loan = Loan.find(params[:id])
    render json: loan.as_json
  end

  private

  def loan_params
    params.require(:loan).permit(:id, :amount, :client_id, :months, :montly_rate_percent)
  end
end
