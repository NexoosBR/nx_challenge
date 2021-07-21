require "rails_helper" 

RSpec.describe LoansController do
  before do
    @loan = Loan.create(financed_amount: 1000, monthly_fee: 0.2, monthly_payments: 36)
  end
  describe "GET show" do
    it do
      get :show, params: { id: @loan.id }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(@loan.id))
    end
  end

  describe "POST show" do
    it do
      post :create, params: { financed_amount: @loan.financed_amount, monthly_fee: @loan.monthly_fee,
                              monthly_payments: @loan.monthly_payments}
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(2))
    end
  end
end
