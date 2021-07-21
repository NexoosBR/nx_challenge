require 'rails_helper'

RSpec.describe "POST loan", :type => :request do
  describe 'POST' do
    context 'with valid attributes' do
      it 'return :created status' do
        post '/loans', params: {
          financed_amount: 1000,
          monthly_fee: 0.2,
          monthly_payments: 36
        }
        expect(response).to have_http_status(:created)
        expect(response.body).to eq("{\"loan\":{\"id\":1}}")
      end
    end

    context 'with invalid attributes' do
      it 'return :unprocessable_entity status' do
        post '/loans', params: {
          financed_amount: 'x',
          monthly_fee: 0.2,
          monthly_payments: 36
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to eq ("{\"financed_amount\":[\"is not a number\"]}")
      end
    end
  end
end