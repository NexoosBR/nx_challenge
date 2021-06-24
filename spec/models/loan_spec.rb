require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:tax) }
    it { should validate_presence_of(:term) }
  end

  describe 'associations' do
    it { should belong_to(:credit) }
  end
end
