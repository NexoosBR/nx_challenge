# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::LoansController, type: :request do
  context 'payments' do
    it 'should return status 200' do
      get api_v1_url(:payments)
      expect(response).to have_http_status(200)
    end

    it 'should have the same id' do
      get api_v1_url(:payments), params: {id: 1}
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(1))
    end
  end

  context 'make_loan' do
    it 'should return status 200' do
      post api_v1_loans_url(:make_loan), params: {present_value: 100, tax: 0.2}
      expect(response).to have_http_status(200)
    end

    it 'should have the same id' do
      post api_v1_loans_url(:make_loan), params: {present_value: 100, tax: 0.2}
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(2))
    end
  end
end
