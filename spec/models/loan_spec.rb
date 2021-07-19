require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:loan) { build :loan }
  let(:invalid) { build :invalid } 


  describe "validations" do
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:months) }
    it { should validate_presence_of(:taxa) }
    it { should validate_numericality_of(:months).only_integer }
    it { should validate_numericality_of(:values).is_greater_than(0) }
    it { should validate_numericality_of(:months).is_greater_than(0) }
    it { should validate_numericality_of(:taxa).is_greater_than(0) }
    it { should validate_numericality_of(:months).is_only_integer }
    it { should validate_numericality_of(:taxa).is_less_than(1) }
  end

  describe "validates pmt" do
    it "calculates the pmt" do
      allow(loan).to receive(:set_pmt)
      loan.save

      expect(loan).to have_received(:set_pmt)
    end

    it "returns the pmt value" do
      loan.save

      expect(loan.pmt.to_f).to eq(225.26)
    end
  end
end
