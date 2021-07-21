class LoansController < ApplicationController
  def create
    loan = Loan.new(loan_params)

    if loan.save
      CreateInstallmentsService.new(loan).call
      render json: loan,
             serializer: Loan::Create::LoanSerializer,
             status: :created
    else
      render json: { errors: loan.errors }, status: :unprocessable_entity
    end
  end

  def show
    loan = Loan.find(params[:id])

    render json: loan, serializer: Loan::Show::LoanSerializer, status: :ok
  end

  def loan_params
    params.require(:loan).permit(
      :total_value, :total_installment, :customer_id
    )
  end
end
