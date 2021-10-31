require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { is_expected.to validate_presence_of(:months) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:fee) }
  it { is_expected.to validate_numericality_of(:months).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:fee).is_greater_than(0) }

  it "Valid field" do
    subject = Loan.new(
      months: 5,
      amount: 300,
      fee: 5,
    )

    expect(subject.amount).to eq(300)
  end

  it "valid loan" do
    loan = build(:loan, amount: 200, fee: 5)

    expect(loan.months).to eq(10)
  end
end
