require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  let(:loan) { create(:loan) }
  let(:loan_params) { build(:loan).attributes }
  let(:customer) { create(:customer) }

  it 'list loans' do
    get :index, params: { customer_id: loan.customer_id }
    expect(response).to have_http_status(:ok)
    expect(response.parsed_body.size).to eq(1)
  end

  it 'show loan' do
    get :show, params: { customer_id: loan.customer_id, id: loan.id }
    expect(response).to have_http_status(:ok)
    expect(response.parsed_body['id']).to eq(loan.id)
  end

  it 'do not show loan with invalid id' do
    get :show, params: { customer_id: loan.customer_id, id: 0 }
    expect(response).to have_http_status(:not_found)
  end

  it 'do not show loan with invalid customer id' do
    get :show, params: { customer_id: 0, id: loan.id }
    expect(response).to have_http_status(:not_found)
  end

  it 'create loan' do
    post :create, params: { customer_id: customer.id, loan: loan_params }
    expect(response).to have_http_status(:created)
    expect(response.parsed_body['installment']).to eq('945.6')
  end

  it 'do not create customer with invalid params' do
    post :create, params: { customer_id: customer.id, loan: loan_params.except('amount') }
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
