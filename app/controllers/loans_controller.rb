class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  def create
    loan = Loan.new(loan_params)

    if loan.save
      render json: { loan: { id: loan.id } }, status: :created
    else
      render json: loan.errors, status: :bad_request
    end
  end

  def show
    render json: { loan: { id: @loan.id, pmt: @loan.pmt } }, status: :ok
  end

  private

  def set_loan
    begin
      @loan = Loan.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e }, status: :not_found
    end
  end

  def loan_params
    params.permit(:value, :months, :taxa)
  end
end
