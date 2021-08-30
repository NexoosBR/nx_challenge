# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pmt" do
  it "should calculate the monthly payment" do
    loan_service = LoanService.new
    expect(loan_service.pmt(100.to_d, 2.to_d, 12)).to eq(9.46.to_d)
  end
end
