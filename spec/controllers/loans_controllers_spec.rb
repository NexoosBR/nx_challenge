# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::LoansController, type: :request do
  context "payments" do
    it "should return status 200" do
      Loan.create(present_value: 100, tax: 0.1)
      get api_v1_url(id: 1, action: "payments")
      expect(response).to have_http_status(200)
    end

    it "should have the same id" do
      Loan.create(present_value: 100, tax: 0.1)
      get api_v1_url(id: 1, action: "payments")
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(1))
    end

    it "should return 404 if loan not found" do
      get api_v1_url(id: 1, action: "payments")
      expect(response).to have_http_status(404)
    end
  end

  context "make_loan" do
    it "should return status 200" do
      post api_v1_loans_url(action: "make_loan"), params: {loan: {present_value: 100, tax: 0.1}}
      expect(response).to have_http_status(200)
    end

    it "should have the same id" do
      post api_v1_loans_url(action: "make_loan"), params: {loan: {present_value: 100, tax: 0.1}}
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(1))
    end

    it "should return 422 if request where unable to process" do
      post api_v1_loans_url(action: "make_loan"), params: {loan: {}}
      expect(response).to have_http_status(422)
    end
  end
end
