require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:loans) }
  end
end
