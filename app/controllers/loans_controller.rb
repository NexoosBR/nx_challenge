# frozen_string_literal: true

class LoansController < ApplicationController
  # POST /loans
  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      render json: { loan: { id: @loan.id, status: :created } }
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # GET /loan/1
  def show
    @loan = Loan.find(params[:id]) if Loan.exists?(params[:id])
    if @loan.present?
      pmt = Loan.calculation_pmt(@loan)
      render json: { loan: { id: @loan.id, pmt: pmt, status: :success } }
    else
      render json: { loan: { message: 'non-existent item', status: :unprocessable_entity } }
    end
  end

  private

  # Permitir apenas uma lista de parametros confiaveis ​​.
  def loan_params
    params.require(:loan).permit(:value, :rate, :installment)
  end
end
