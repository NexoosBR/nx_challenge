require 'rails_helper'

RSpec.describe "Clients", type: :request do
  describe "POST /create" do
    it 'should return status ok' do
      client = {client: {name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: "712.132.390-79"} }
      post clients_path, params: client

      expect(response).to have_http_status(201)
    end

    it 'should return the new client in json format' do

      client = {client: {name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: "712.132.390-79"} }
      post clients_path, params: client

      expect(response).to have_http_status(201)
      expect(response.body).to include "Lucas Dalbonio"
      expect(response.body).to include "example@email.com"
      expect(response.body).to include "21999999999"
      expect(response.body).to include "712.132.390-79" 
    end
  end
end