require "rails_helper"

RSpec.describe Loan, type: :model do
  it 'Create Loan'  do
    loan = Loan.new(value: 999.00, rate: 2.0)
    expect(loan.value).to eq(999.00)
    expect(loan.rate).to eq(2.0)
    expect(loan.installments).to eq(12)
  end

  it 'Calculating PMT with loan of 1000.00 and rate 2.0' do
    loan = Loan.new(value: 1000.00, rate: 2.0)
    pmt = loan.calculate_pmt
    expect(pmt).to eq(94.56)
  end

  it 'Calculating PMT with loan of 999.00 and rate of 2.8' do
    loan = Loan.new(value: 999.00, rate: 2.8)
    pmt = loan.calculate_pmt
    expect(pmt).to eq(99.17)
  end
end
