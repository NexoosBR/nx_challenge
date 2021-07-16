# frozen_string_literal: true

class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  def create
    loan = Loan.new loan_params

    if loan.save
      render json: loan, status: :created
    else
      render json: loan.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @loan
  end

  private

  def set_loan
    @loan = Loan.find params[:id]
  end

  def loan_params
    params.require(:loan).permit(:value, :installments, :rate)
  end
end
