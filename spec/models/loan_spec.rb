require 'rails_helper'

RSpec.describe Loan, type: :model do
  fixtures :clients

  it "valid - all data ok" do
    client = clients(:one)
    loan = Loan.new(amount: 1, months: 1, montly_rate_percent: 0.2,
      client: client)
    expect(loan).to be_valid
  end

  it "not valid - missing paramters" do
    loan = Loan.new()
    expect(loan).to_not be_valid

    expect(loan.errors[:client]).to include("must exist")
    expect(loan.errors[:amount]).to include("can't be blank")
    expect(loan.errors[:amount]).to include("is not a number")
    expect(loan.errors[:months]).to include("can't be blank")
    expect(loan.errors[:months]).to include("is not a number")
    expect(loan.errors[:montly_rate_percent]).to include("can't be blank")
    expect(loan.errors[:montly_rate_percent]).to include("is not a number")
  end

  it "create - will calculate PMT" do
    client = clients(:one)
    loan = Loan.create!(amount: 1000, months: 12, montly_rate_percent: 1,
      client: client)
    expect(loan.pmt).to be_within(0.01).of(BigDecimal('88.85'))
  end
end
