# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoansController do
  describe 'POST /loans' do
    context 'with valid params' do
      let(:loan_params) { { value: 1000, taxa: 0.2 } }

      it 'returns load id' do
        post :create, params: loan_params
        params = JSON.parse(response.body).with_indifferent_access

        expect(params).to eq ( {"loan"=>{"id"=> Loan.last.id}})
      end

      it 'return status 200 - :ok' do
        post :create, params: loan_params

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:loan_params) { { value: 0, taxa: -1 } }

      it 'returns message errors' do
        post :create, params: loan_params
        loan = Loan.create(amount: 0, rate: -1, installments: 12)
        params = JSON.parse(response.body).with_indifferent_access

        expect(params[:message][:errors]).to eq(loan.errors.full_messages)
      end

      it 'returns status 200 - :ok' do
        post :create, params: loan_params

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET /loans/:id' do
    before do
      Loan.create(amount: 100, rate: 0.2, installments: 12)
    end

    context 'with valid params' do
      it 'returns load id' do
        get :show, params: { id: 1 }
        params = JSON.parse(response.body).with_indifferent_access

        expect(params[:loan]).to eq(
          {
            'id' => Loan.first.id.to_s,
            'pmt' => Loan.first.calc_pmt.to_s
          }
        )
      end

      it 'returns status 200 - :ok' do
        get :show, params: { id: 1 }

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'returns message errors' do
        get :show, params: { id: 'x' }
        params = JSON.parse(response.body).with_indifferent_access

        expect(params[:message][:errors]).to eq('Loan not found')
      end

      it 'returns status 200' do
        get :show, params: { id: 1 }

        expect(response).to have_http_status(:ok)
      end
    end
  end
end