require 'rails_helper'

RSpec.describe Loan, type: :model do
  let!(:cliente) { create(:cliente) }
  
  it { is_expected.to belong_to(:cliente) }
  
  it { should validate_presence_of(:pv) }
  it { should validate_presence_of(:taxa_mensal) }
  it { should validate_presence_of(:meses) }
  it { should validate_presence_of(:cliente_id) }

  describe "gera_pmt" do
    it "gerado corretamente" do
      loan = create(:loan, :fixo, cliente_id: cliente.id)
      loan.save!
      
      expect(loan.pmt).to eq(99.17)
    end

    it "gerado incorretamente" do
      loan = build(:loan, :fixo, pv: 1500, cliente_id: cliente.id)
      loan.save!
      
      expect(loan.pmt).not_to eq(99.17)
    end
  end
end
