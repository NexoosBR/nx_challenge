class LoansController < ApplicationController
  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      render json: { loan: { id: @loan[:id] } }
    else
      render json: { errors: @loan.errors, status: :internal_server_error }
    end
  end

  def show
    @loan = Loan.find(params['id'])
    render json: { loan: { id: @loan.id, pv: @loan.present_value, rate: @loan.rate, periods: @loan.periods, pmt: @loan.pmt } }
  end

  private
    def loan_params
      params.permit(:present_value, :rate, :periods)
    end
end
