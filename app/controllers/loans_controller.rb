class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  def create
    @loan = Loan.new(
      value: params[:value],
      tax: params[:tax],
      months: params[:months]
    )
    if @loan.save
      render json: { loan: { id: @loan.id } }
    else
      render json: { loan: { id: nil } }
    end
  end

  def show
    if @loan.present?
      render json: { loan: { id: @loan.id, pmt: @loan.pmt } }
    else
      render json: { loan: nil }
    end
  end

  private
    def set_loan
      @loan = Loan.find(params[:id]) rescue nil
    end

end
