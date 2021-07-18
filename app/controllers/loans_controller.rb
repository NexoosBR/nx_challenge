class LoansController < ApplicationController
  def create
    loan = Loan.new(loan_params)

    if loan.save
      render json: loan, serializer: LoanSerializer, status: :created
    else
      render json: { errors: loan.errors }, status: :unprocessable_entity
    end
  end

  def show
    pmt =  3000 / 12

    render json: { loan: { id: 1, pmt: pmt } }
  end

  def loan_params
    params.require(:loan).permit(:total_value, :total_installment, :customer_id)
  end
end
