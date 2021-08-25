require 'rails_helper'

describe Loan do
  it 'verification of pmt calculation method' do
    loan = create(:loan, value: 3700, rate: 2)
    other_loan = create(:loan, value: 1248, rate: 3)

    expect(loan.pmt.ceil(2).to_s).to eq('349.88')
    expect(other_loan.pmt.ceil(2).to_s).to eq('125.38')
  end
end
