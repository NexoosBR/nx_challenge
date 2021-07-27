class LoansController < ApplicationController
  ##
  # POST /loans
  # curl --request POST http://localhost:3000/loans -d 'value=1000&monthly_fee=0.2&months=1'
  # Expected response:
  #
  #   { 
  #     "loan": {
  #       "id": 1
  #     }
  #   }
  def create
    @loan = Loan.new(loan_params)
    
    if @loan.save
      render json: { loan: { id: @loan.id }}
    else
      render json: { errors: @loan.errors }, status: :unprocessable_entity
    end
  end


  ##
  # GET /loans/ID
  # curl --request GET http://localhost:3000/loans/1
  # Expected response:
  #
  #   {
  #     "loan": {
  #       "id": 1, "pmt": 1010.0
  #     }
  #   }
  def show
    loan = Loan.find_by_id(params[:id])
    if loan
       render json: {loan: loan.id, pmt: loan.pmt}, status: :ok
    else
       render json: {error: "loan was not found"}, status: :not_found
    end
  end

  private

  def loan_params
    params.permit(:value,:monthly_fee,:months,:pmt,:id)
  end
end
