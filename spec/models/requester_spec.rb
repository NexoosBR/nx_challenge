require 'rails_helper'

RSpec.describe Requester, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cnpj) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:commercial_address) }
    it { should validate_presence_of(:company_birth) }
  end
end
