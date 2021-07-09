require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:loan) { build(:loan) }

  describe 'associations' do
    it { expect(subject).to belong_to(:customer) }
  end

  describe 'validations' do
    it { expect(loan).to validate_numericality_of(:amount).is_greater_than_or_equal_to(100) }
    it { expect(loan).to validate_numericality_of(:amount).is_less_than_or_equal_to(999_999_999) }
    it { expect(loan).to validate_numericality_of(:monthly_rate).is_greater_than_or_equal_to(0) }
    it { expect(loan).to validate_numericality_of(:monthly_rate).is_less_than_or_equal_to(1_000) }
    it { expect(loan).to validate_numericality_of(:months).is_greater_than_or_equal_to(1) }
    it { expect(loan).to validate_numericality_of(:months).is_less_than_or_equal_to(420) }
  end
end
