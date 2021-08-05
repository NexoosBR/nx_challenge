class LoansController < ApplicationController
  def create
    render json: { loan: { id: 1 } }
  end

  def show
    pmt =  3_700 / 12
    render json: { loan: { id: 1, pmt: pmt } }
  end

  private
    def loan_params
      params.permit(:present_value, :rate, :periods)
    end
end

# present_value:float rate:float periods:integer pmt:float
