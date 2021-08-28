# frozen_string_literal: true

require "rails_helper"

RSpec.describe LoanRepository, type: :class do
  context "#find_loan_by_id" do
    it "returns a loan" do
      Loan.create(present_value: 100, tax: 0.1)
      loan = LoanRepository.new.find_loan_by_id(1)
      expect(loan.id).to eq(1)
    end
  end

  context "#create_loan" do
    params = {"present_value" => 100, "tax" => 1.2}
    it "creates a loan" do
      loan = LoanRepository.new.create_loan(params)
      expect(loan.present_value).to eq(100)
      expect(loan.tax).to eq(1.2)
    end
  end
end
