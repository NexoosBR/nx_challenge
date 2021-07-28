require "rails_helper" 

RSpec.describe ClientsController do
  describe "Index - no parameters will return all clients" do
    fixtures :clients

    it do
      get :index

      expect(response.status).to be(200)
      response.header['Content-Type'].should include 'application/json'

      clients_count = Client.all.count
      expect(JSON.parse(response.body).count).to be(clients_count)
    end
  end

  describe "POST" do
    it do
      post :create, :params => { :client => { :email => "testing_controller@something.com.br"}}
      expect(response.status).to be(200)
      response.header['Content-Type'].should include 'application/json'

      param = JSON.parse(response.body)
      expect(param['email']).to eq("testing_controller@something.com.br")
      expect(param['id'].class).to eq(Integer)
      expect(param['id']).to be > 0
    end
  end
end
