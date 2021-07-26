class LoansController < ApplicationController
  #before_action :set_state, only: [:show, :update, :destroy]
  require 'json'

  def create
    

   @loan = Loan.create(params.require(:loan).permit(:taxa, :value, :number_of_months, :name))

  
    p = @loan.number_of_months
    taxa = @loan.taxa 

    taxa = taxa + 1
    
    calculo1 =  (taxa**p).round(10)
    calculo2 = calculo1

    calculo1 = calculo1 * @loan.taxa 
    calculo2 = calculo2 - 1

    resultado = (calculo1/calculo2).round(10)
   resultado = resultado * @loan.value


    @loan.pmt = resultado.round(5)
    @loan.save

    render json: { loan: {"id": @loan.id } }
end

  def show

    @loan = Loan.find(params[:id])
    render json: { loan: { id: @loan.id, pmt: @loan.pmt } }

  end




end
