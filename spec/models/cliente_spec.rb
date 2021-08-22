require 'rails_helper'

RSpec.describe Cliente, type: :model do
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:telefone) }
  
  it { should validate_uniqueness_of(:cpf) }
end
