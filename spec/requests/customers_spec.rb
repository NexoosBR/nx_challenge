require 'rails_helper'
require 'support/request_helper'

RSpec.describe "Customers", type: :request do
  describe "POST#create" do
    context 'when the customer is created' do
      it 'must return 201 status code' do
        customer_params = attributes_for(:customer, name: "joão")

        post "/customers", params: { customer: customer_params }

        expect(response).to have_http_status(:created)
      end

      it 'must return the customer created' do
        customer_params = attributes_for(:customer, name: "joão")

        post "/customers", params: { customer: customer_params }

        expect(json_body).to have_key(:name)
      end
    end

    context 'when the customer is not created' do
      it 'must return 422 status code' do
        customer_params = attributes_for(:customer, name: nil)

        post "/customers", params: { customer: customer_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return the error message' do
        customer_params = attributes_for(:customer, name: nil)

        post "/customers", params: { customer: customer_params }

        expect(json_body).to have_key(:errors)
      end
    end
  end
end
