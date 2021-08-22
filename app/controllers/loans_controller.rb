require_relative '../helpers/calculate_pmt'

class LoansController < ApplicationController
  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      render json: { Loan: { id: @loan[:id] } }, status: 201
    else
      raise 'Erro ao gerar PMT. Tente novamente.'
    end
  end

  def show
    @loan = Loan.find(params[:id])
    render json: { Loan: { id: @loan[:id], pmt: @loan[:pmt] } }, status: 200
  end

  private

  def loan_params
    params.require(:loan).permit(:financed_amount, :rate, :months)
  end
end
