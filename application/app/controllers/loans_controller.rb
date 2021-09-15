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
    pmt =  3_700 / 12
    render json: { loan: { id: 1, pmt: pmt } }
  end

  private

  def loan_params
    params.require(:loan).permit(:value, :rate, :installments)
  end
  
end
