class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  def create
    loan = Loan.new create_params

    if loan.save
      render json: loan
    else
      render json: { errors: loan.errors }
    end
  end

  def show
    render json: { loan: @loan }
  end

  private

  def set_loan
    @loan ||= Loan.find params[:id]
  end

  def create_params
    params.require(:loan).permit(:value, :installments, :rate)
  end
end
