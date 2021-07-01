class LoansController < ApplicationController
  def create
    @loan = Loan.new(value: params[:value], taxa: params[:taxa])
    if @loan.save
      render json: { loan: { id: @loan.id } }
    else
      render_error
    end
  end

  def show
    loan = Loan.find(params[:id])
    render json: { loan: { id: loan.id, pmt: loan.pmt } }
  end

  private

  def render_error
    render json: { errors: @loan.errors.full_messages },
      status: :unprocessable_entity
  end
end
