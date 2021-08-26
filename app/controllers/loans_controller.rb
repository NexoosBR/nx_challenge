class LoansController < ApplicationController
  def create
    render json: {loan: {id: 1}}
  end

  def show
    pmt =  3_700 / 12
    render json: {loan: {id: 1, pmt: pmt}}
  end
end
