require 'rails_helper'

RSpec.describe Loan, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to have_many(:installments) }
  end
end
