class ClientsController < ApplicationController

    def create
        client = Client.new(client_params)

        if client.save
            render json: client.as_json
        else
            render json: { errors: client.errors, status: :unprocessed }
        end
    end

    def index
        clients = Client.all
        render json: clients.includes(:loans).as_json
    end

    private

    def client_params
      params.require(:client).permit(:id, :email)
    end
end
