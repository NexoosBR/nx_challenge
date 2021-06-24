module Api
  module V1
    class CreditsController < ApplicationController
      def create
        credit = Credit.new(credit_params)

        if credit.accept.upcase == 'S'
          credit.save
          render json: { status: 'SUCCESS', message:'Crédito salvo com sucesso!', data:credit },
          status: :ok
        else
          render json: {status: 'ERROR', message:'Não foi possível registrar o crédito', data:credit.errors},
          status: :unprocessable_entity
        end
      end

      private

      def credit_params
        params.require(:credit).permit %i(amount credit_at accept requester_id)
      end
    end
  end
end
