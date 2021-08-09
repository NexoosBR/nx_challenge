# frozen_string_literal: true

require 'rails_helper'

describe CalculatorPmtService do
  describe '#call' do
    subject { described_class.new(amount: 1000, instalment_number: 3, tax: 2) }
    it { expect(subject.call).to eq(346.75) }
  end
end
