class LoansController < ApplicationController

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
    pmt =  3_700 / 12
    render json: { loan: { id: 1, pmt: pmt } }
  end

  private

  def loan_params
    params.require(:loan).permit(:finance, :tax, :months)
  end
end
