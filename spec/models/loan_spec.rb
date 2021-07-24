require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'attributes' do
    before do
      @loan = Loan.new(
        value: 2000,
        taxa: 0.1,
        quantity: 10
      )
    end

    it "is not valid with invalid attributes" do
      expect(Loan.new).to_not be_valid
    end

    it "is valid with invalid attributes" do
      expect(@loan).to be_valid
    end

    it "is invalid value" do
      @loan.value = ''
      @loan.save
      expect(@loan.errors[:value][0]).to(eq("can't be blank"))
      expect(@loan.errors[:value][1]).to(eq("is not a number"))
    end

    it "is invalid taxa" do
      @loan.taxa = ''
      @loan.save
      expect(@loan.errors[:taxa][0]).to(eq("can't be blank"))
      expect(@loan.errors[:taxa][1]).to(eq("is not a number"))
      @loan.taxa = 1.1
      @loan.save
      expect(@loan.errors[:taxa][0]).to(eq("must be less than or equal to 1.0"))
    end

    it "is invalid value" do
      @loan.quantity = ''
      @loan.save
      expect(@loan.errors[:quantity][0]).to(eq("can't be blank"))
      expect(@loan.errors[:quantity][1]).to(eq("is not a number"))
      @loan.quantity = 1.1
      @loan.save
      expect(@loan.errors[:quantity][0]).to(eq("must be an integer"))
    end
  end
end
