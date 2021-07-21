class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  def create
    @loan = Loan.new(loans_params)
    @loan.calculate
    @loan.save!
  rescue
    render json: { errors: { fields: @loan.errors.messages }}, status: :unprocessable_entity
  end

  def show; end

  private

    def loans_params
      params.require(:loan).permit(:taxa, :value)
    end

    def set_loan
      @loan = Loan.find(params[:id])
    end
    
 
end
