require "rails_helper"

RSpec.describe "Loan requests", type: :request do
  
  context "GET /loans/:id" do
    let(:loan) { create(:loan) }
    let(:url) { "/loans/#{loan.id}" }

    it "returns requested loan" do
      get url, headers: header()
      expected_loan = loan.as_json(only: %i(id pmt))
      expected_loan['pmt'] = expected_loan['pmt'].to_f
      expect(body_json['loan']).to eq expected_loan
    end

    it "returns success status" do
      get url, headers: header()
      expect(response).to have_http_status(:ok)
    end

  end

  context "POST /loans" do
    let(:url) { "/loans" }
    
    context 'with valid params' do

      let(:loan_params) { { loan: attributes_for(:loan) }.to_json }

      it 'adds a new Loan' do
        expect do
          post url, headers: header(), params: loan_params
        end.to change(Loan, :count).by(1)
      end

      it 'returns last added loan' do
        post url, headers: header(), params: loan_params
        expected_loan = Loan.last.as_json(only: %i(id))
        expect(body_json['loan']).to eq expected_loan
      end

      it 'returns success status' do
        post url, headers: header(), params: loan_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      let(:loan_invalid_params) do 
        { loan: attributes_for(:loan, taxa: -1) }.to_json
      end

      it 'does not add a new Loan' do
        expect do
          post url, headers: header(), params: loan_invalid_params
        end.to_not change(Loan, :count)
      end

      it 'returns error message' do
        post url, headers: header(), params: loan_invalid_params
        expect(body_json['errors']['fields']).to have_key('taxa')
      end

      it 'returns unprocessable_entity status' do
        post url, headers: header(), params: loan_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  end

end