require 'rails_helper'

RSpec.describe Api::V1::CreditsController, type: :controller do 
  describe 'POST /api/v1/credits' do
    context 'creating credit' do   
      let(:credit) { create(:credit) }
      let(:credit_attributes) { attributes_for(:credit) }

      it 'returns success' do
        expect {
          post :create, params: {credit: credit_attributes}
        }.to change(Credit, :count).by(1)
      end
    end
  end
end
