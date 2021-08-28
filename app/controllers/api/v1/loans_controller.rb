# frozen_string_literal: true

module Api
  module V1
    class LoansController < ApplicationController
      def make_loan
        render json: {loan: {id: 2}}
      end

      def payments
        pmt =  3_700 / 12
        render json: {loan: {id: 1, pmt: pmt}}
      end
    end
  end
end
