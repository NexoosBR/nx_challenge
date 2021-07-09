module Loans
  class PmtCalculateService < ApplicationService
    def initialize(context)
      @amount = context[:amount]
      @rate = context[:monthly_rate]
      @months = context[:months]
    end

    def call
      calculate_installment
    end

    private

    attr_accessor :amount, :rate, :months

    def calculate_installment
      installment = amount * (((1 + rate)**months) * rate) / (((1 + rate)**months) - 1)
      installment.round(2)
    end
  end
end
