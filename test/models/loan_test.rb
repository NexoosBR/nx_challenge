require 'rails_helper'

RSpec.describe Loan, :type => :model do

  it "is not valid with valid attributes" do
    expect(Loan.new).to_not be_valid
  end
end