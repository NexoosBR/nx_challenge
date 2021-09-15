require "rails_helper" 

RSpec.describe LoansController, type: :controller do
  describe "GET show" do
    it do
      loan = create(:loan)
      get :show, params: { id: loan.id }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(loan.id))
    end


    it do
      loan = create(:loan)
      get :show, params: { id: 9999 }
      expect(response).to have_http_status(404)
    end

  end

  describe "POST create" do
    it 'create' do
      post :create, :params => { :loan => { value: 30_000, rate: 0.02, installments: 15 }}
      expect(response).to have_http_status "201"
    end

    it 'not create' do
      post :create, :params => { :loan => { value: 30_000, rate: 0, installments: 15 }}
      param = JSON.parse(response.body).with_indifferent_access

      expect(response).to have_http_status "422"
    end
  end
end
