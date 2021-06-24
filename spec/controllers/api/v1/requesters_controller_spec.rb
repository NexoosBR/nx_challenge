require 'rails_helper'

RSpec.describe Api::V1::RequestersController, type: :controller do 
  describe 'POST /api/v1/requesters' do
    context 'creating requester' do   
      let(:requester) { create(:requester) }
      let(:requester_attributes) { attributes_for(:requester) }

      it 'returns success' do
        expect {
          post :create, params: {requester: requester_attributes}
        }.to change(Requester, :count).by(1)
      end
    end
  end
end
