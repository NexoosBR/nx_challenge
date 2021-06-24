module Api
  module V1
    class LoansController < ApplicationController
      include ActionView::Helpers::NumberHelper

      def show
        loan = Loan.find(params[:id])

        amount = loan.amount.to_i
        term   = loan.term.to_i
        tax    = loan.tax.to_f

        payment = amount * ((((1 + tax)**term) * tax) / (((1 + tax)**term) - 1))

        message = "O pagamento ficou em: #{term} x #{number_to_currency(payment)} - (Com juros total anual de: #{number_to_percentage((tax * 100),
                                          precision: 2, 
                                          strip_insignificant_zeros: true)})"
        
        render json: { status: 'SUCCESS', message: "#{message}", data:loan },
        status: :ok
      end

      def create
        loan = Loan.new(loan_params)

        if loan.save
          render json: { status: 'SUCCESS', message: 'Empréstimo realizado com sucesso!', data:loan },
          status: :ok
        else
          render json: {status: 'ERROR', message: 'Não foi possível seu empréstimo no momento', data:loan.errors },
          status: :unprocessable_entity
        end
      end

      private

      def loan_params
        params.require(:loan).permit %i(amount tax term credit_id)
      end
    end
  end
end
