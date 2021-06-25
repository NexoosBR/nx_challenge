require "rails_helper"

describe LoanPresenter do
  let(:loan) { double(name: 'Empresa de Teste Nacional') }
  subject { described_class.new(loan) }

  it { expect(loan.name).to eq('Empresa de Teste Nacional') }

  describe 'PMT' do
    it 'returns calc payment' do
      allow(subject).to receive(:calculate_pmt).and_return(:message)
      calc = subject.calculate_pmt

      expect(subject.calculate_pmt).to eq(calc)
    end
  end
end