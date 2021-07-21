require 'rails_helper'

RSpec.describe Loan, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:total_value) }
    it { is_expected.to validate_presence_of(:total_installment) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to have_many(:installments) }
  end
end
