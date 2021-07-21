require 'rails_helper'

RSpec.describe Loan, type: :model do
  before do
    @loan = Loan.new(financed_amount: 1000, monthly_fee: 0.2, monthly_payments: 36)
  end
  it "is valid with valid attributes" do
    expect(@loan).to be_valid
  end

  it "is not valid without a financed amount" do
    @loan.financed_amount = nil
    expect(@loan).to_not be_valid
  end

  it "is not valid without a monthly fee" do
    @loan.monthly_fee = nil
    expect(@loan).to_not be_valid
  end

  it "is not valid without a quantity of monthly payments" do
    @loan.monthly_payments = nil
    expect(@loan).to_not be_valid
  end

  it "is not valid with a financed amount minor to 0" do
    @loan.financed_amount = -1
    expect(@loan).to_not be_valid
  end

  it "is not valid with a monthly fee minor to 0" do
    @loan.monthly_fee = -1
    expect(@loan).to_not be_valid
  end

  it "is not valid with a quantity of monthly payments minor to 0" do
    @loan.monthly_payments = -1
    expect(@loan).to_not be_valid
  end

  it "is not valid with a financed amount not numeric" do
    @loan.financed_amount = "x"
    expect(@loan).to_not be_valid
  end

  it "is not valid with a monthly fee not numeric" do
    @loan.monthly_fee = "x"
    expect(@loan).to_not be_valid
  end

  it "is not valid with a quantity of monthly payments not numeric" do
    @loan.monthly_payments = "x"
    expect(@loan).to_not be_valid
  end

  it "is not valid with a quantity of monthly payments not integer" do
    @loan.monthly_payments = 2.0
    expect(@loan).to_not be_valid
  end

  it "calculate the pmt before creating" do
    expect(@loan.payments_value).to be_nil
    @loan.save
    expect(@loan.payments_value).to_not be_nil
  end

end
