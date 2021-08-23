require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:months) }
    it { should validate_presence_of(:rate) }

    it { should validate_numericality_of(:value).is_greater_than(0) }
    it { should validate_numericality_of(:months).is_greater_than(0) }
    it { should validate_numericality_of(:rate).is_greater_than(0) }
  end

  it 'calculate pmt' do
    loan = Loan.create(value: 1000, rate: 0.05, months: 5)

    expect(loan.calc_pmt).to eq(230.97)
  end

  it 'should add lecture to question_type' do
    # --Arrange
    loan = Loan.new(value: 1000, rate: 0.05, months: 5)

    # --Act + Assert
    expect(loan.pmt).to eq(nil)
    loan.save!
    expect(loan.reload.pmt).to eq(230.97)
  end
end