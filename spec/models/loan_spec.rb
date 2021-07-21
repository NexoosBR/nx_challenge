require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { is_expected.to validate_presence_of :value }
  it { is_expected.to validate_presence_of :rate}
  it { is_expected.to validate_presence_of :months_period }
  it { is_expected.to validate_numericality_of(:value).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:rate).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:months_period).is_greater_than(0) }

  describe '#call_pmt_calculation' do
    let!(:loan) { create(:loan) }

    it "should call pmt_calculation" do
      expect(loan).to receive(:pmt_calculation)
      loan.call_pmt_calculation
    end
  end
end