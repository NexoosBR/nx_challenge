require "rails_helper" 

RSpec.describe LoansController do
  describe "GET show" do
    fixtures :loans

    it do
      get :show, params: { id: 1 }
      expect(response.status).to be(200)
      response.header['Content-Type'].should include 'application/json'

      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:id]).to(eq(1))
    end
  end

  describe "POST show" do
    fixtures :clients

    it do
      post :create, :params => { :loan => { :amount => 1000, :months => 12,
        :montly_rate_percent => 1, :client_id => 1}}
      expect(response.status).to be(200)
      response.header['Content-Type'].should include 'application/json'

      param = JSON.parse(response.body)
      expect(param['amount']).to eq("1000.0")
      expect(param['months']).to be(12)
      expect(param['montly_rate_percent']).to eq("1.0")
      expect(param['client_id']).to be(1)
      expect(param['pmt'].class).to eq(String)
      expect(param['id'].class).to eq(Integer)
      expect(param['id']).to be > 0
    end
  end
end
