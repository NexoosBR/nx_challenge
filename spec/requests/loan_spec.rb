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

  context "POST loan" do
    let(:url) { "/loans" }

    context "with valid params" do
      let(:loan_params) { { loan: attributes_for(:loan) }.to_json }
    
      it "adds a new Loan" do
        expect do
          post url, headers: header, params: loan_params
        end.to change(Loan, :count).by(1)
      end

      it "returns last added Loan" do
        post url, headers: header, params: loan_params
        expected_loan = Loan.last.as_json(only: %i(id))
        expect(body_json).to eq expected_loan
      end

      it "returns success status" do
        post url, headers: header, params: loan_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      let(:invalid_loan_params) { { loan: attributes_for(:loan, months_period: nil) }.to_json }

      it "does not add a new Loan" do
        expect do
          post url, headers: header, params: invalid_loan_params
        end.to_not change(Loan, :count)
      end

      it "returns unprocessable entity status" do
        post url, headers: header, params: invalid_loan_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
