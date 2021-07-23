class LoansController < ApplicationController
  before_action :get, only: [:show]
  def create
    loan = Loan.new(loan_params)
    if loan.save
      pmt = CreatePmtService.new(loan_params).create
      loan.update(pmt: pmt)
      render json: { message: 'Loan created with success', loan: loan }, status: :created
    else
      render json: loan.errors, status: :unprocessable_entity
    end
  end

  def show
    pmt = CreatePmtService.new({ id: @loan.id }).format
    render json: pmt
  end

  private

  def get
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(
      :value,
      :taxa,
      :quantity
    )
  end
end
