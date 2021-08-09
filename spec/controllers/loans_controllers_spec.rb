require "rails_helper"

RSpec.describe LoansController do
  describe "GET show" do
    before(:each) do
      loan_params = {
        id: 1,
        total_value: 1000,
        monthly_fee: 0.3,
        number_of_months: 48
      }
      Loan.create!(loan_params)
    end
    context '200 OK' do
      it 'With a valid loan param' do
        get :show, params: { id: 1 }
        expect(response).to have_http_status(:ok)
      end
    end

    context '404 Not Found' do
      it 'When not found loan by id' do

        get :show, params: { id: 0 }

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST show" do
    context '201 Created' do
      it 'When have one company and is in corporative plan' do
        loan_params = {
          "total_value": 1000,
          "monthly_fee": 0.3,
          "number_of_months": 48
        }
        post :create, params: {loan: loan_params}

        expect(response).to have_http_status(:created)
      end
    end
  end
end
