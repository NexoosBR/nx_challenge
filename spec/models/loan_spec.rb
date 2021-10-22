require 'rails_helper'

RSpec.describe Loan, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:months) }
    it { is_expected.to validate_presence_of(:fee) }

    it { is_expected.to validate_numericality_of(:value) }
    it { is_expected.to validate_numericality_of(:months) }
    it { is_expected.to validate_numericality_of(:fee) }
  end

  it "deve calcular a PMT corretamente" do
    loan = Loan.new(value: 5000, months: 24, fee: 11)
    loan.save
    expect(loan.pmt.to_f).to eq(598.94)
  end
end
