class LoansController < ApplicationController
  before_action :set_record, only: %i[show]

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      render json: { loan: { id: @loan.id } }, status: :created
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: { loan: @loan }, status: :ok
  end

  private

  def set_record
    @loan = Loan.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def loan_params
    params.require(:loan).permit(:monthly_fee, :number_of_months, :total_value)
  end
end
