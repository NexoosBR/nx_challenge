require 'rails_helper'

RSpec.describe "Clients", type: :request do
  describe "POST /create" do
    it "returns http success" do
      post "/clients", params: { client: {
        first_name: "Rafael",
        last_name: "Carrilho",
        document: "122.222.222-21",
        email: "rafael@email.com",
        birthdate: "10/02/2000"
      }}
      expect(response).to have_http_status(:success)
    end
  end

end
