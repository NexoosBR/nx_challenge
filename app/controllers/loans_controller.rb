class LoansController < ApplicationController
  def create
    render json: { loan: { id: 1 } }
  end

  def show
    # pmt =  3_700 / 12
    loan = Loan.find(params[:id])
    render json: { loan: { id: loan.id, pmt: loan.pmt } }
  end
end
