require 'rails_helper'
require 'support/request_helper'

RSpec.describe "Loans", type: :request do
  describe "POST#create" do
    context 'when the loan is created' do
      it 'must return 201 status code' do
        customer = create(:customer)
        loan_params = attributes_for(:loan, 
                                     total_value: 7000,
                                     total_installment: 3,
                                     customer_id: customer.id)

        post "/loans", params: { loan: loan_params }

        expect(response).to have_http_status(:created)
      end

      it 'must return the loan created' do
        customer = create(:customer)
        loan_params = attributes_for(:loan, 
                                     total_value: 7000, 
                                     total_installment: 3, 
                                     customer_id: customer.id)

        post "/loans", params: { loan: loan_params }

        expect(json_body).to have_key(:total_value)
        expect(json_body).to have_key(:total_installment)
        expect(json_body).to have_key(:customer_name)
        expect(json_body).to have_key(:installments)
      end
    end

    context 'when the loan is not created' do
      it 'must return 422 status code' do
        customer = create(:customer)
        loan_params = attributes_for(:loan,
                                     total_value: nil,
                                     total_installment: nil,
                                     customer_id: nil)

        post "/loans", params: { loan: loan_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return the error message' do
        customer = create(:customer)
        loan_params = attributes_for(:loan,
                                     total_value: nil,
                                     total_installment: nil,
                                     customer_id: nil)

        post "/loans", params: { loan: loan_params }

        expect(json_body).to have_key(:errors)
      end
    end
  end

  describe "GET#show" do
    context 'when the loan is found' do
      it 'must return 200 status code' do
        customer = create(:customer)
        loan = create(:loan, customer_id: customer.id)

        get "/loans/#{loan.id}"

        expect(response).to have_http_status(:ok)
      end

      it 'must return the loan found' do
        customer = create(:customer)
        loan = create(:loan, customer_id: customer.id)

        get "/loans/#{loan.id}"

        expect(json_body).to have_key(:total_value)
        expect(json_body).to have_key(:total_installment)
        expect(json_body).to have_key(:customer_name)
        expect(json_body).to have_key(:installments)
      end
    end
  end
end