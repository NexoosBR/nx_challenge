require "rails_helper" 

RSpec.describe CalculatePmt do
  subject { described_class.new(loan) }

  describe '#call' do
    let(:loan) { create(:loan) }

    context 'with valid data' do
      it 'returns amount' do
        expect(subject.call.to_s).to eq '522.72'
      end
    end
  end
end
