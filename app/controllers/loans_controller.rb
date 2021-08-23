class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show ]

  def create
    loan = Loan.create(value: loan_params[:value], rate: loan_params[:taxa])
    if loan.save
      render json: { loan: { id: loan.id } }
    else
      render json: { message: { errors: "Unable to create the loan"} }
    end
  end

  def show
    pmt = @loan.calculate_pmt
    render json: { loan: { id: @loan.id, pmt: pmt } }
  end

  private
  def loan_params
    params.permit(:value, :taxa)
  end

  def set_loan
    begin
     @loan = Loan.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { message: { errors: "Loan not found" } }
    rescue ActiveRecord::ActiveRecordError
      # handle other ActiveRecord errors
    rescue # StandardError
      # handle most other errors
    rescue Exception
      # handle everything else
      raise
    end

  end


end
