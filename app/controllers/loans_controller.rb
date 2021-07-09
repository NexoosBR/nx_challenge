class LoansController < ApplicationController
  def index
    loans = Loan.where(customer_id: params[:customer_id])
    render json: loans
  end

  def show
    loan = Loan.find_by!(id: params[:id], customer_id: params[:customer_id])
    render json: loan
  end

  def create
    loan = Loan.new(loan_params)
    loan.customer = Customer.find_by(id: params[:customer_id])

    if loan.save
      render json: loan, status: :created
    else
      render json: { errors: loan.errors }, status: :unprocessable_entity
    end
  end

  private

  def loan_params
    params.require(:loan).permit(
      :amount,
      :monthly_rate,
      :months
    )
  end
end
