class LoansController < ApplicationController
  def create
    render json: { loan: { id: 1 } }
  end

  def show
    @loan = Loan.find(params[:id])
    render :show
  rescue
    render_error(fields: @loan.errors.messages)
  end
end
