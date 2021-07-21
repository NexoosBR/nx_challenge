class ClientsController < ApplicationController
    def create
        client = Client.new(client_params)
        if client.valid?
            client.save
            render json: {client: client}, status: :created
        else
            render json: {errors: client.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private 
    def client_params
        params.require(:client).permit(:name, :email, :phone, :cpf)
    end

end
