require "rails_helper" 

RSpec.describe AuthenticateController, type: :controller do
  render_views
  describe "POST create" do
    it do
      post :create, format: :json

      response_body = {
        api_key: {
          key: ApiKey.find_by(remote_ip: '0.0.0.0').key
        }
      }

      expect(response.content_type).to eq "application/json; charset=utf-8"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq(response_body)
    end
  end
  
end