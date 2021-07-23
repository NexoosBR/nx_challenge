require 'rails_helper'

RSpec.describe Client, type: :model do
  let(:client) { create(:client) }

  context 'Basic model validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(75) }
    it { should_not allow_value('fa').for(:name) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_length_of(:nickname).is_at_least(3).is_at_most(20) }
    it { should allow_value("email@email.com").for(:email) }
    it { should_not allow_value("email@").for(:email) }
    it { should_not allow_value("e@e.").for(:email) }

    it { is_expected.to validate_uniqueness_of(:nickname) }
    it { is_expected.to validate_uniqueness_of(:nickname) }
    it { is_expected.to validate_length_of(:nickname).is_at_least(3).is_at_most(20) }
  end

  context 'Associations validations' do
    it { is_expected.to have_many(:loans) }
  end

end
