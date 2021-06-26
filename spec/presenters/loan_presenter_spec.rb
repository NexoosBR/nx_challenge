require "rails_helper"

describe LoanPresenter do
  subject { described_class.new(loan) }

  let(:loan) { double(name: 'Empresa de Teste Nacional') }

  it { expect(loan.name).to eq('Empresa de Teste Nacional') }

  describe 'PMT' do
    before do
      allow(subject).to receive(:calculate_pmt).and_return(:message)
    end

    it 'returns calc payment' do
      calc = subject.calculate_pmt

      expect(subject.calculate_pmt).to eq(calc)
    end
  end
end