require 'rails_helper'

RSpec.describe Installment, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:loan) }
  end
end
