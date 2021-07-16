class ClientsController < ApplicationController
  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client
    else
      render json: @client.errors, status: 422
    end
  end

  private 
    def client_params
      params.require(:client).permit(:first_name, :last_name, :document, :birthdate, :email)
    end
end
