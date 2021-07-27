require "rails_helper" 

RSpec.describe LoansController do

  describe "GET show" do
    it 'must return a pmt' do
      Loan.create(value:1000,months:1,monthly_fee:1)
      get :show, params: { id: 1 }
      loan = JSON.parse(response.body).with_indifferent_access
      expect(loan[:pmt]).to_not be_nil
    end
  end

  describe "POST show" do
    it 'must be created' do
      params = {
        loan: {
          value: 1000,
          months: 1,
          monthly_fee: 1
        }
      }
      post :create, params: params
      param = JSON.parse(response.body).with_indifferent_access
      expect(response).to have_http_status(:created)
    end
  end

end
