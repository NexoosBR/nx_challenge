require 'rails_helper'

RSpec.describe 'Loans', type: :request do
  describe 'POST' do
    let(:post_loan) { post '/loans', params: { value: 1000, taxa: 0.2 } }
    let(:post_invalid) { post '/loans', params: { value: nil, taxa: nil } }

    context 'when success' do
      it 'returns created status' do
        post_loan

        expect(response).to have_http_status(:created)
      end

      it 'create loan in database' do
        expect { post_loan }.to change(Loan, :count)
      end
    end

    context 'when error' do
      it 'returns bad request status' do
        post_invalid
        
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns validations error messages' do
        post_invalid
        
        expect(response.body).to eq("{\"value\":[\"can't be blank\",\"is not a number\"],\"taxa\":[\"can't be blank\",\"is not a number\"]}")
      end

      it 'does not create loan in database' do
        expect { post_invalid }.not_to change(Loan, :count)
      end
    end
  end

  describe 'GET' do
    let!(:loan) { create(:loan) }
    let(:get_loan) { get "/loans/#{loan_id}" }

    context 'when id exists' do
      let(:loan_id) { loan.id }

      it 'returns ok status' do
        get_loan

        expect(response).to have_http_status(:ok)
      end

      it 'returns json response' do
        get_loan
  
        expect(response.body).to eq("{\"loan\":{\"id\":1,\"pmt\":\"225.26\"}}")
        expect(response).to have_http_status(:ok)
      end
    end
    
    
    context 'when id does not exist' do
      let(:loan_id) { 0 }
      
      it 'raise error record not found' do
        get_loan
        
        expect(response.body).to eq("{\"error\":\"Couldn't find Loan with 'id'=#{loan_id}\"}")
        expect(response).to have_http_status 404
      end
    end
  end
end
