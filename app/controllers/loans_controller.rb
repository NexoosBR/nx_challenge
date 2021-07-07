class LoansController < ApplicationController
  def create

    begin

      if exist_params?([:value, :tax, :time], params)
        response = LoansCreaterService.call(params)
        render json: response
      end
    

    rescue StandardError => e

      render json: {error: e}, status: :bad_request 

    end

   
    
  end

  def show

    begin

      if exist_params?([:id], params)
        response = LoansShowService.call(params)
        render json: response
      end
    

    rescue StandardError => e

      render json: {error: e}, status: :bad_request 

    end
    
  end
end
