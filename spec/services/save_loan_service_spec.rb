# frozen_string_literal: true

require 'rails_helper'

describe SaveLoanService do
  describe '#call' do
    context 'when save with valid params' do
      let(:params) { build(:loan_expected_attributes_hash) }
      subject { described_class.new(params: params) }
      it 'create new loan' do
        expect do
          subject.call
        end.to change(Loan, :count).by(1)
      end
    end

    context 'when try save with invalid params' do
      let(:params) { build(:loan_invalid_expected_attributes_hash) }
      subject { described_class.new(params: params) }

      it 'return validation error' do
        expect(subject.call.errors.full_messages).to include("Due date can't be blank")
      end
    end
  end
end
