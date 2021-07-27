require 'rails_helper'

RSpec.describe Loan, type: :model do

  it "is not valid without a value" do
    loan = Loan.new(monthly_fee:2.0,months:1)
    loan.valid?
    expect(loan.errors[:value]).to include("can't be blank")
    loan = Loan.new(value:"",monthly_fee:2.0,months:1)
    loan.valid?
    expect(loan.errors[:value]).to include("can't be blank")
  end

  it "is not valid without a monthly fee" do
    loan = Loan.new(value:1000,months:1)
    loan.valid?
    expect(loan.errors[:monthly_fee]).to include("can't be blank")
    loan = Loan.new(value:1000,monthly_fee:"",months:1)
    loan.valid?
    expect(loan.errors[:monthly_fee]).to include("can't be blank")
  end

  it "is not valid without months" do
    loan = Loan.new(value:1000,monthly_fee:2.0)
    loan.valid?
    expect(loan.errors[:months]).to include("can't be blank")
    loan = Loan.new(value:1000,monthly_fee:2.0,months:"")
    loan.valid?
    expect(loan.errors[:months]).to include("can't be blank")
  end
  
end
