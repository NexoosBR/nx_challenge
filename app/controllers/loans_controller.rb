class LoansController < ApplicationController
  def create
    loan = Loan.new(loan_params)

    if loan.save
      render json: { loan: { id: loan.id } }, status: :created
    else
      render json: loan.errors, status: :unprocessable_entity
    end
  end

  def show
    loan = Loan.find_by(id: params[:id])

    if loan
      render json: { loan: { id: loan.id, pmt: loan.pmt } }, status: :ok
    else
      render :json, status: 404
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:value, :months, :rate, :installment)
  end
end
