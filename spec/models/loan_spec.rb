require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:loan) { FactoryBot.build :loan }

  describe '#calcularpmt' do
    subject { loan.calculapmt }
    it { expect(subject).to eq(52.52) }
  end
end
