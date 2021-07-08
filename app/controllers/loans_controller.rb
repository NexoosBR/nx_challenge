class LoansController < ApplicationController
  before_action :set_loan, only: :show

  def create
    @parcel = ParcelCalculatorService.call(loan_params)
    @loan = Loan.new(loan_params)
    @loan.update(parcel: @parcel)

    if @loan.save
      render json: {
        loan: {
          id: @loan.id,
          finance: @loan.finance,
          tax: @loan.tax,
          months: @loan.months,
          pmt: @loan.parcel
        }
      }
    else
      render json: { errors: @loan.errors }, status: :unprocessable_entity
    end

  end

  def show
    render json: { loan: { id: @loan.id, pmt: @loan.parcel } } if @loan.present?
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:finance, :tax, :months)
  end
end
