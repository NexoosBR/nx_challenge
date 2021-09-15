class V1::LoansController < ApplicationController

  def create
    @loan = Loan.new(user_params)
    @loan.calculapmt
    if @loan.save
      render json: { loan: { id: @loan.id } },
      status: :created
    else
      render json: { errors: @loan.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def show
    @loan = Loan.find(params[:id])
    render json:
      { loan: { id: @loan.id, pmt: @loan.pmt } },
      status: :ok
  end

  private
  def user_params
    params.permit(:valor, :taxa, :nprestacoes)
  end
end
