class LoansController < ApplicationController
  def create
    loan = Loan.new
    loan.value = params[:value]
    loan.tax = params[:tax]
    # calcular PMT
    loan.pmt = loan.value * loan.tax * (1 + loan.tax) ** 12 / ((1 + loan.tax) ** 12 - 1)
    loan.save
    render json: { loan: { id: loan.id } }
  end

  def show
    pmt =  Loan.find(params[:id]).pmt
    loan = Loan.find(params[:id])
    render json: { loan: { id: loan.id, pmt: pmt.round(2) } }
  end
end
