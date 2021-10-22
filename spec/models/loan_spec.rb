require 'rails_helper'

RSpec.describe Loan, type: :model do
  it "deve calcular a PMT corretamente" do
    loan = Loan.new(value: 5000, months: 24, fee: 11)
    loan.save
    expect(loan.pmt.to_f).to eq(598.94)
  end
end
