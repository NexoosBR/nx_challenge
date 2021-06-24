require 'rails_helper'

RSpec.describe Credit, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:amount) }
  end

  describe 'associations' do
    it { should belong_to(:requester) }
    it { should have_many(:loans) }
  end
end
