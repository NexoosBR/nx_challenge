require "rails_helper" 

RSpec.describe LoansController do
  fixtures :all

  describe "GET show" do
    it 'must be pmt correct' do
      get :show, params: { id: 1 }
      loan = JSON.parse(response.body).with_indifferent_access
      expect(loan[:pmt]).to(eq(2000.0))
    end
  end

  describe "POST show" do
    it 'must be created' do
      params = {
        loan: {
          value: 2000,
          taxa: 0.1,
          quantity: 10
        }
      }
      post :create, params: params
      param = JSON.parse(response.body).with_indifferent_access
      expect(response).to have_http_status(:created)
      expect(param[:loan][:id]).to(eq(2))
      expect(param[:loan][:pmt]).to(eq(4000))
    end

    it 'must not be created' do
      params = {
        loan: {
          value: '',
          taxa: 0.1,
          quantity: 10
        }
      }
      post :create, params: params
      param = JSON.parse(response.body).with_indifferent_access
      expect(response).to_not have_http_status(:created)
      expect(param[:id]).to(eq(nil))
    end
  end
end
