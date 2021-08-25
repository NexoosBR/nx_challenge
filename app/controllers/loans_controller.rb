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
    return head :no_content if loan.nil?

    render json: { loan: { id: loan.id, pmt: loan.pmt } }
  end

  private

  def loan_params
    params.require(:loan).permit(:value, :rate, :pmt)
  end
end
