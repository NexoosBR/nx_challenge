module Api
  module V1
    class LoansController < ApplicationController
      def show
        loan = LoanPresenter.new(Loan.find(params[:id]))
        loan.calculate_pmt

        render json: { status: 'SUCCESS', message: "#{loan.calculate_pmt}", data:loan },
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
