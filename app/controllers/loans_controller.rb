class LoansController < ApplicationController
  def create
    # byebug
    @loan = Loan.new(loan_params)
    if @loan.save
      render json: { loan: { id: @loan.id } }
    else
      render json: { error: "Algo deu errado. Tente novamente."}, status: :unprocessable_entity
    end
  end

  def show
    @loan = Loan.find(params[:id])
    render json: @loan, adapter: :json
  end

  private

  def loan_params
    params.permit(:value, :fee, :months)
  end
end
