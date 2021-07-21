require "rails_helper"

describe "Loan", type: :request do
  
  let!(:loan) { create(:loan)}
  context "GET loan" do
    let(:url) {"/loans/#{loan.id}"}

    it "returns loan" do
      get url, headers: header
      expected_loan = loan.as_json(only: %i(id pmt))
      expect(body_json['loan']).to eq(expected_loan)
    end

    it "returns success status" do
      get url, headers: header
      expect(response).to have_http_status(:ok)
    end
  end
end
