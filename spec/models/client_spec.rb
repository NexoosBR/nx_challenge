require 'rails_helper'

RSpec.describe Client, type: :model do
  subject { build(:client) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:client_type) }
  it { is_expected.to validate_presence_of(:cpf_cnpj) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:telephone) }

  it { is_expected.to validate_uniqueness_of(:cpf_cnpj).case_insensitive }

  it { is_expected.to have_many(:loans) }
end
