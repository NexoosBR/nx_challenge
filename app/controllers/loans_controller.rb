class LoansController < ApplicationController
  def create
    pmt = PMT::Loans.new(10045.0, 1.2, 12)
    render json: pmt.calculate, status: :ok
  end

  def show
    pmt =  3_700 / 12
    render json: { loan: { id: 1, pmt: pmt } }
  end
end
