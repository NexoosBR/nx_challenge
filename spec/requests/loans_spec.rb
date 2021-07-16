# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Loans', type: :request do
  describe 'POST /loans' do
    let(:post_loan) { post '/loans', params: { loan: loan_params } }

    context 'when success' do
      let(:loan_params) { attributes_for :loan }

      it 'returns created status' do
        post_loan

        expect(response).to have_http_status(:created)
      end

      it 'create loan in database' do
        expect { post_loan }.to change(Loan, :count)
      end

      it 'returns loan content' do
        post_loan

        expect(response.body).to eq(Loan.last.to_json)
      end
    end

    context 'when invalid' do
      let(:loan_params) { attributes_for(:loan, :invalid) }

      let(:expected_content) do
        {
          'installments' => ['must be greater than 0'],
          'rate' => ['must be greater than 0'],
          'value' => ['must be greater than 0']
        }
      end

      it 'returns bad request status' do
        post_loan

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create loan on database' do
        expect { post_loan }.not_to change(Loan, :count)
      end

      it 'returns errors' do
        post_loan

        expect(response.parsed_body).to eq(expected_content)
      end
    end
  end

  describe 'GET /loans/:id' do
    let(:get_loan) { get "/loans/#{loan_id}" }

    let!(:loan) { create(:loan) }

    context 'when id exists' do
      let(:loan_id) { loan.id }

      it 'returns ok status' do
        get_loan

        expect(response).to have_http_status(:ok)
      end

      it 'returns loan content' do
        get_loan

        expect(response.body).to eq(loan.to_json)
      end
    end

    context 'when id does not exist' do
      let(:loan_id) { 0 }

      it 'raise error record not found' do
        expect { get_loan }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
