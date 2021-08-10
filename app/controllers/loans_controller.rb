class LoansController < ApplicationController

  def create
    @loan = SaveLoanService.new(params: loan_params.to_h).call

    if @loan.valid?
      @loan
    else
      render json: { error: @loan.errors.full_messages }, status: 400
    end
  end

  def show
    @loan = Loan.find_by(id: params[:id])
    head :not_found if @loan.nil?
  end

  private

  def loan_params
    params.permit(:tax, :instalment_number, :amount, :due_date)
  end
end
