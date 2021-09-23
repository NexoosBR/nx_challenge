class LoansController < ApplicationController
  before_action :set_loan_id, only: %i[ show ]
  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      render json: { loan: { id: @loan.id } }, status: :created
    else
      return render json: @loan.errors, status: :unprocessable_entity
    end    
  end

  def show
    if @loan.nil? == false
      render json: { loan: { id: @loan.id, pmt: @loan.pmt } }
    else
      return render json: { message: ('not found') }, status: :not_found
    end    
  end

  private
  def set_loan_id
    @loan = Loan.find_by(id: params[:id])
  end

  def loan_params
    params.require(:loan).permit(:value, :taxa, :pmt)
  end
end
