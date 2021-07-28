require 'rails_helper'

RSpec.describe LoansController do
  describe 'GET index' do
    it 'access the Loans index with success' do
      get :index
      expect(response).to have_http_status :ok
    end
  end

  describe 'GET show' do
    it 'get information for a specific Laon by id' do
      loan = FactoryBot::create(:loan)
      get :show, params: { id: loan.id }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param.fetch(:id)).to(eq(loan.id))
    end
  end

  describe 'POST show' do
    it 'get informartion after create a new Loan' do
      client = FactoryBot::create(:client)
      post :create, params: { loan: {
        loan_amount: Faker::Number.decimal(r_digits: 2, l_digits: 3),
        interest_rate: Faker::Number.decimal(r_digits: 2, l_digits: 2),
        period: Faker::Number.within(range: 1..60),
        client_id: client.id
        }
      }, format: :json
      param = JSON.parse(response.body).with_indifferent_access
      expect(param.fetch(:id)).to(eq(2))
    end
  end
end
