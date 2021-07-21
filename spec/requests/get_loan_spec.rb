require 'rails_helper'

RSpec.describe 'GET loan', type: :request do
  before do
    @loan = Loan.create(financed_amount: 1000, monthly_fee: 0.2, monthly_payments: 36)
  end

  describe 'GET' do
    context 'with existing id' do
      it 'returns :ok status' do
        get "/loans/#{@loan.id}"
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq("{\"loan\":{\"id\":1,\"pmt\":\"200.282564948001\"}}")
      end
    end

    context 'with non existing id' do
      id = 0
      it 'returns 404 record not found' do
        get "/loans/#{id}"
        expect(response).to have_http_status(:not_found)
        expect(response.body).to eq( "{\"error\":\"Couldn't find Loan with 'id'=0\"}")
      end
    end
  end

end