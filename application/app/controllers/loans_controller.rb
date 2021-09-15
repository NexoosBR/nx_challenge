class LoansController < ApplicationController

  def create
    loan = Loan.new(loan_params)
    if loan.save
      render json: { loan: { id: loan.id } }, status: :created
    else
      render json: { errors: loan.errors }, status: :unprocessable_entity
    end
  end

  def show
    loan = Loan.find_by_id params[:id]
    if loan
      render json: { loan: { pmt: loan.pmt }}, status: :ok
    else
      render json: { error: "loan not found" }, status: :not_found
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:value, :rate, :installments)
  end

end
