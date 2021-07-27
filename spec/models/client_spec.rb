require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validation' do
    context 'cpf' do
      it { should validate_presence_of(:cpf) }
      it { should validate_uniqueness_of(:cpf) }
    end

    context 'name' do
      it { should validate_presence_of(:name) }
    end

    context 'phone_number' do
      it { should validate_presence_of(:phone_number) }
    end
  end
end
