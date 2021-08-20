# frozen_string_literal: true

class LoansController < ApplicationController
  def create
    loan = Loan.create(amount: loan_params[:value], rate: loan_params[:taxa])
    if loan.id.present?
      render json: { loan: { id: loan.id } }
    else
      render json: { message: { errors: loan.errors.full_messages } }
    end
  end

  def show
    loan = Loan.where(id: params[:id]).first
    if loan.present?
      pmt = loan.calculation_of_monthly_amortization
      render json: { loan: { id: params[:id], pmt: pmt } }
    else
      render json: { message: { errors: 'Loan not found' } }
    end
  end

  private

  def loan_params
    params.permit(:value, :taxa)
  end
end
