require 'rails_helper'

RSpec.describe Loan, type: :model do
  it "Valid if value and tax exists" do
    loan = Loan.new( 
      value: 1000, 
      tax: 0.2
    ) 
   
   expect(loan).to be_valid 
  end
  
  it "Invalid if value null" do 
    loan = Loan.new( 
      value: nil, 
      tax: 0.2
    ) 
    loan.valid?   
    expect(loan.errors[:value]).to include("can't be null") 
  end
  
  it "Invalid if tax null" do 
    loan = Loan.new( 
      value: 1000, 
      tax: nil
    ) 
    loan.valid?   
    expect(loan.errors[:tax]).to include("can't be null") 
  end
end
