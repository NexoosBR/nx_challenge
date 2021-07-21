class LoansController < ApplicationController
  def create
    @loan = Loan.new(loan_params)
    @loan.call_pmt_calculation
    @loan.save!
    render json: @loan, only: [:id]
  rescue
    render_error(fields: @loan.errors.messages)
  end

  def show
    @loan = Loan.find(params[:id])
    render :show
  rescue
    render_error(fields: @loan.errors.messages)
  end

  private

  def loan_params
    params.require(:loan).permit(:rate, :value, :months_period)
  end
end
