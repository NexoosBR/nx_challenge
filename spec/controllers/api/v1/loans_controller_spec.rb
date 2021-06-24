require 'rails_helper'

RSpec.describe Api::V1::LoansController, type: :controller do 
  describe 'Loans' do
    let(:loan) { create(:loan) }
    let(:loan_attributes) { attributes_for(:loan) }
    
    context 'POST /loans' do   
      it 'returns success' do
        expect {
          post :create, params: {loan: loan_attributes}
        }.to change(Loan, :count).by(1)
      end
    end

    context 'GET /loans' do
      let(:loan) { create(:loan) }

      it 'return loan attributes' do
        expect {
          post :show, params: {id: loan.id}
        }.to change(Loan, :count).by(1)
      end
    end
  end
end
