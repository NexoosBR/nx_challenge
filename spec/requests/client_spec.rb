require 'rails_helper'

RSpec.describe "Clients", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/client/create"
      expect(response).to have_http_status(:success)
    end
  end

end
