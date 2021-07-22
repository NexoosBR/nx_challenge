# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loan, type: :model do
  # Variavel temporario para validação de atributo, o error é acionado quando o valor é passado como vazio ou que não seja numero
  subject do
    described_class.new(value: '1',
                        rate: '2',
                        installment: '5')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a value' do
    subject.value = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a rate' do
    subject.rate = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a installment' do
    subject.installment = nil
    expect(subject).to_not be_valid
  end
end
