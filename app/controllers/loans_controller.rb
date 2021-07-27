class LoansController < ApplicationController
  before_action :load_client

  def index
    @loans = @client.loans
  end

  def create
    @loan = @client.loans.new(loan_params)

    if @loan.save
      render :create, status: :created
    else
      render json: { errors: @loan.errors, status: :unprocessed }
    end
  end

  def show
    @loan = @client.loans.find(params[:id])
    @pmt = CalculatePmt.new(@loan).call

    render :show
  end

  private

  def load_client
    @client = Client.find(params[:client_id])
  end

  def loan_params
    params.require(:loan).permit(
      :amount,
      :number_of_months,
      :monthly_fee
    )
  end
end
