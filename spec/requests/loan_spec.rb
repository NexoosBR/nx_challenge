require "rails_helper"

RSpec.describe "Loan requests", type: :request do
  
  context "GET /loans/:id" do
    let(:loan) { create(:loan) }
    let(:url) { "/loans/#{loan.id}" }

    it "returns requested loan" do
      get url, headers: auth_header()
      expected_loan = loan.as_json(only: %i(id pmt))
      expected_loan['pmt'] = expected_loan['pmt'].to_f
      expect(body_json['loan']).to eq expected_loan
    end

    it "returns success status" do
      get url, headers: auth_header()
      expect(response).to have_http_status(:ok)
    end

  end

  context "POST /loans" do
    let(:url) { "/loans" }
    let(:loan_params) { { loan: attributes_for(:loan) }.to_json }

    it 'adds a new Loan' do
      expect do
        post url, headers: auth_header(), params: loan_params
      end.to change(Loan, :count).by(1)
    end

    it 'returns last added loan' do
      post url, headers: auth_header(), params: loan_params
      expected_loan = Loan.last.as_json(only: %i(id))
      expect(body_json['loan']).to eq expected_loan
    end

    it 'returns success status' do
      post url, headers: auth_header(), params: loan_params
      expect(response).to have_http_status(:ok)
    end
   

  end


end