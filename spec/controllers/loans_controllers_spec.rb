require "rails_helper"

RSpec.describe LoansController do
  describe "GET show" do
    it do
      loan = Loan.create(value: 100, tax: 1, months: 3)
      get :show, params: { id: loan.id }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(loan.id))
    end
  end

  describe "POST show" do
    it do
      post :create, params: { value: 100, tax: 1, months: 3 }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(Loan.order(:id).last.id))
    end
  end
end
