class LoansController < ApplicationController
  before_action :set_loan, only: :show

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      render json: { loan: { id: @loan.id } }
    else
      render json: @loan.errors, status: :unprocessable_entity
    end 
  end

  def show
    pv = @loan.value
    i = @loan.taxa
    pmt =  pv*i*( 1+i)**12/( 1+i )**12 -1
    render json: { loan: { id: @loan.id, pmt: pmt } }
  end

  private 

  def set_loan 
      @loan = Loan.find(params[:id])
  end

  def loan_params
    params.fetch(:loan, {}).permit(:value, :taxa)
  end
end
