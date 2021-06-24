module Api
  module V1
    class RequestersController < ApplicationController
      def create
        requester = Requester.new(requester_params)

        if requester.save
          render json: { status: 'SUCCESS', message:'Cliente salvo com sucesso!', data:requester },
          status: :ok
        else
          render json: {status: 'ERROR', message:'Não foi possível salvar o cliente', data:requester.erros},
          status: :unprocessable_entity
        end
      end

      private

      def requester_params
        params.require(:requester).permit %i(name cnpj phone email commercial_address company_birth)
      end
    end
  end
end