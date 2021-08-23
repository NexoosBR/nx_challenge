class LoansController < ApplicationController
  before_action :set_cliente, only: [:create]
  

  def create
    @loan = @cliente.loans.new( loan_params )

    if @loan.save
      render json: @loan, status: 201, location: @loan
    else
      render json: @loan.errors, status: 422
    end
  end

  def show
    @loan = Loan.find(params[:id])
    render json: @loan
  end

  private

  def set_cliente
    @cliente = Cliente.find(params[:loan][:cliente_id])
  end

  def loan_params
    params.require(:loan).permit(:pv, :taxa_mensal, :meses, :cliente_id)
  end
end
