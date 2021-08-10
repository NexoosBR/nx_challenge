require "rails_helper" 

RSpec.describe LoansController, type: :controller do
  render_views
  describe "GET show" do
    let(:params) { build(:loan_expected_attributes_hash) }
    let(:headers) { { 'X-Api-Key' => ApiKey.find_by(remote_ip: '100').key }}
    before do
      SaveLoanService.new(params: params).call
      ApiKey.create(remote_ip: '100')
    end
    
    it do
      request.headers.merge! headers
      get :show, params: { id: 1 }, format: :json

      response_body = {
        loan: {
          id: 1,
          instalment_number: 3,
          pmt: "346.75",
          amount: "1000.0",
          tax: "0.02",
          due_date: "10/10/2020"
        }
      }

      expect(response.content_type).to eq "application/json; charset=utf-8"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq(response_body)
    end
  end

  describe "POST create" do
    context "returns loan created" do
      let(:params) { build(:loan_expected_attributes_hash) }
      let(:headers) { { 'X-Api-Key' => ApiKey.find_by(remote_ip: '100').key }}
      before do
        ApiKey.create(remote_ip: '100')
      end
      it do
        request.headers.merge! headers
        post :create, params: params, format: :json

        response_body = {
            loan: {
              id: 1,
              instalment_number: 3,
              pmt: "346.75",
              amount: "1000.0",
              tax: "0.02",
              due_date: "10/10/2020"
          }
        }

        expect(response.content_type).to eq "application/json; charset=utf-8"
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).deep_symbolize_keys).to eq(response_body)
      end
    end

    context "returns error with invalid params" do
      let(:params) { build(:loan_invalid_expected_attributes_hash) }
      let(:headers) { { 'X-Api-Key' => ApiKey.find_by(remote_ip: '100').key }}
      before do
        ApiKey.create(remote_ip: '100')
      end
      it do
        request.headers.merge! headers
        post :create, params: params, format: :json

        expect(response.content_type).to eq "application/json; charset=utf-8"
        expect(response.status).to eq(400)
        expect(JSON.parse(response.body)["error"]).to include("Due date can't be blank")
      end
    end
    
  end
end
