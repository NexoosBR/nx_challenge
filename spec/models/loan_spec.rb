require 'rails_helper'

describe Loan do
  it 'verification of pmt calculation method' do
    loan = Loan.create(value: 3700, taxa: 2)
    other_loan = Loan.create(value: 1248, taxa: 3)

    expect(loan.pmt).to eq(349.88)
    expect(other_loan.pmt).to eq(125.38)
  end
end