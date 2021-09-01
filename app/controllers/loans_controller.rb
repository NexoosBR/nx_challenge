class LoansController < ApplicationController
  before_action :load_loan, only: %i[show]

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      render json: { message: 'Successfully generated loan' }, status: :created # 201
    else
      render json: { errors: @loan.errors.full_messages }, status: :bad_request # 400
    end
  end

  def show
    render json: @loan.to_json(except: [:created_at, :updated_at])
  end

  private

  def loan_params
    params.require(:loan).permit(:present_value, :rate, :period, :amount)
  end

  def load_loan
    @loan = Loan.find(params[:id])
  end
end
