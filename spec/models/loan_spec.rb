require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:loan) { create(:loan) }

  context 'Basic model validations' do
    it { is_expected.to validate_presence_of(:loan_amount) }
    it { is_expected.to validate_numericality_of(:loan_amount).is_greater_than(0) }

    it { is_expected.to validate_presence_of(:interest_rate) }
    it { is_expected.to validate_numericality_of(:interest_rate).is_greater_than(0) }

    it { is_expected.to validate_presence_of(:period) }
    it { is_expected.to validate_numericality_of(:period).only_integer }
    it { is_expected.to validate_numericality_of(:period).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:period).is_less_than_or_equal_to(60) }

    it { should define_enum_for(:period_type) }

    it 'Testing loan date' do
      expect(FactoryBot::build(:loan, :loan_with_future_start_date)).to_not be_valid
      expect(FactoryBot::build(:loan, :loan_with_past_start_date)).to_not be_valid
    end

    it { should belong_to(:client) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:client) }
  end

  context 'Calculating Fixed Loan Payment (PMT)' do
    it 'For simples values' do
      expect(FactoryBot::build(:loan, :simple_loan_payment).fixed_loan_payment_calculating).to eq(945.60)
    end
  end
end
