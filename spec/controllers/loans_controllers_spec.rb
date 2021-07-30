require "rails_helper"

RSpec.describe LoansController, type: :controller do

  let(:valid_params){ {months: 1, monthly_tax: 0.001, amount: 0.01} }
  describe "#show" do
    before { Loan.create(valid_params) }

    context 'when id is valid' do
      it 'shows id and pmt fields' do
        get :show, params: { id: 1 }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'when id is not valid' do
      it 'returns not found' do
        get :show, params: { id: 2 }
        json = JSON.parse(response.body)
        expect(json['error']).to eq("Couldn't find Loan with 'id'=2")
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "#create" do
    context 'when params are valid' do

      before { post :create, params: valid_params }

      it 'returns status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'shows id field' do
        json = JSON.parse(response.body)
        expect(json['loan']['id']).to eq(1)
      end

      it 'creates a loan record' do
        expect(Loan.last.id).to eq 1
      end

    end

    context 'when params are not valid' do

      before do
        params = {months: 0, monthly_tax: 0.001, amount: 0.01}
        post :create, params: params
      end

      it 'shows status = unprocessable entity' do
        expect(response).to have_http_status :unprocessable_entity
      end

      it 'does not create any record' do
        expect(Loan.count).to eq 0
      end

      it 'shows error message' do
        json = JSON.parse(response.body)
        expect(json['months']).to include 'must be greater than 0'
      end
    end
  end
end
