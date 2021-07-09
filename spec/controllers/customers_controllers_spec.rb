require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  let(:customer) { create(:customer) }
  let(:customer_params) { build(:customer).attributes }

  it 'show customer' do
    get :show, params: { id: customer.id }
    expect(response).to have_http_status(:ok)
    expect(response.parsed_body['id']).to eq(customer.id)
  end

  it 'do not show customer with invalid id' do
    get :show, params: { id: 0 }
    expect(response).to have_http_status(:not_found)
  end

  it 'create customer' do
    post :create, params: { customer: customer_params }
    expect(response).to have_http_status(:created)
  end

  it 'do not create customer with invalid params' do
    post :create, params: { customer: customer_params.except('full_name') }
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'update customer' do
    post :update, params: { id: customer.id, customer: { full_name: 'fake company' } }
    expect(response).to have_http_status(:ok)
    expect(response.parsed_body['full_name']).to eq('fake company')
  end

  it 'do not update customer with invalid params' do
    post :update, params: { id: customer.id, customer: { full_name: nil } }
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'destroy customer' do
    delete :destroy, params: { id: customer.id }
    expect(response).to have_http_status(:no_content)
  end

  it 'do not destroy customer with loans' do
    customer_with_loan = create(:customer, :with_loan)
    delete :destroy, params: { id: customer_with_loan.id }
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
