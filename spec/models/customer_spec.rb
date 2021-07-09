require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { build(:customer) }

  describe 'associations' do
    it { expect(subject).to have_many(:loans) }
  end

  describe 'validations' do
    it { expect(customer).to validate_presence_of(:full_name) }
    it { expect(customer).to validate_length_of(:full_name).is_at_most(255) }
    it { expect(customer).to validate_presence_of(:document) }
    it { expect(customer).to validate_length_of(:document).is_at_most(18) }
    it { expect(customer).to validate_uniqueness_of(:document).case_insensitive }
  end
end
