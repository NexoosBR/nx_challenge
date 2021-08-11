require 'rails_helper'

RSpec.describe Loan, type: :model do
  before(:each) do
    @loan = Loan.new(
      value: 1999,
      fee: 3,
      months: 2
      )
  end
  
  it "Valid Loan" do
    expect(@loan).to be_valid
  end
  
  it "Invalid number of months" do
    @loan.months = 0
    expect(@loan).not_to be_valid
  end

  it "Invalid Fee (> 100%)" do
    @loan.fee = 142
    expect(@loan).not_to be_valid
  end

  it "Checking PMT" do
    @loan.save
    expect(@loan.pmt).to be == 1044.7
  end
end
