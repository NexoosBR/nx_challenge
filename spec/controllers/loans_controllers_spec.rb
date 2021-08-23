require 'rails_helper'

RSpec.describe LoansController, type: :request do
  context 'requests' do
    it 'Show loan by id' do
      get '/loans/45'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body.size)).to eq(2)
    end
  end
end
