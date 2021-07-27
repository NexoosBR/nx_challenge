class ClientsController < ApplicationController
  def index
    @clients = Client.includes(:loans).all
    render :index
  end

  def create
    @client = Client.new(client_params)
    
    if @client.save
      render :create, status: :created
    else
      render json: { errors: @client.errors, status: :unprocessed }
    end
  end

  private

  def client_params
    params.require(:client).permit(
      :name,
      :phone_number,
      :cpf
    )
  end
end