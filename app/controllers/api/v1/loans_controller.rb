# frozen_string_literal: true

module Api
  module V1
    class LoansController < ApplicationController
      def make_loan
        response = LoanService.new.create_loan(loan_params) if params[:loan].present?
        render json: {loan: {id: response.id}} if response
        render json: {error: "Unable to process request"}, status: :unprocessable_entity unless response
      end

      def payments
        response = LoanService.new.find_loan_by_id(params[:id]) if params[:id].present?
        render json: {loan: {id: response.id, pmt: response.payments}} if response
        render json: {error: "Loan not found"}, status: :not_found unless response
      end

      private

      def loan_params
        params.require(:loan).permit(:present_value, :tax)
      end
    end
  end
end
