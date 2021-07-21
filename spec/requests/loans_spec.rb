require 'rails_helper'

RSpec.describe "Loans", type: :request do
  describe "POST /create" do
    it 'should return status created' do
      client = Client.create(name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: "712.132.390-79")  
      loan = {loan: {value: 1000, months: 1, rate: 0.02, client_id: client.id} }
      post loans_path, params: loan

      expect(response).to have_http_status(201)
    end

    it 'should not return the new loan in json format' do

      client = Client.create(name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: "712.132.390-79")  
      loan = {loan: {value: 1000, months: 1, rate: 0.02, client_id: client.id} }
      post loans_path, params: loan

      expect(response.body).to_not include "value"
      expect(response.body).to_not include "months"
      expect(response.body).to_not include "rate"
      expect(response.body).to_not include "client_id"
    end
  end


  describe "GET /show" do
    it 'should return status ok' do
      client = Client.create(name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: "712.132.390-79")  
      loan = Loan.create(value: 1000, months: 1, rate: 0.02, client_id: client.id)
      get loan_path(loan)

      pmt = loan.pmt

      expect(response).to have_http_status(200)
      expect(response.body).to_not include "value"
      expect(response.body).to_not include "months"
      expect(response.body).to_not include "rate"
      expect(response.body).to_not include "client_id"
      expect(response.body).to include pmt.to_s
    end
  end
end
