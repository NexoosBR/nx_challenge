# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:loan) { build :loan }

  describe 'validations' do
    it { expect(loan).to validate_presence_of(:value) }
    it { expect(loan).to validate_presence_of(:installments) }
    it { expect(loan).to validate_presence_of(:rate) }
    it { expect(loan).to validate_numericality_of(:installments).only_integer.is_greater_than(0) }
    it { expect(loan).to validate_numericality_of(:value).is_greater_than(0).is_less_than(9_999_999_999.99) }
    it { expect(loan).to validate_numericality_of(:rate).is_greater_than(0).is_less_than(1) }
  end

  describe 'callbacks' do
    describe '#set_pmt' do
      it 'calls set pmt' do
        allow(loan).to receive(:set_pmt)

        loan.save

        expect(loan).to have_received(:set_pmt)
      end

      it 'calculate pmt' do
        loan.save

        expect(loan.pmt.to_f).to eq(212.16)
      end
    end
  end
end
