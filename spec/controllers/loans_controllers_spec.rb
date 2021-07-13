require "rails_helper"

RSpec.describe LoansController do
  describe "GET show" do
    context 'there is data' do
      it 'return the id of a loan' do
        loan = Loan.create(value: 100, tax: 1, months: 3)
        get :show, params: { id: loan.id }
        param = JSON.parse(response.body).with_indifferent_access
        expect(param[:loan][:id]).to(eq(loan.id))
      end
    end

    context 'there is no data' do
      it 'return the id of a loan' do
        get :show, params: { id: 99 }
        param = JSON.parse(response.body).with_indifferent_access
        expect(param[:loan]).to(eq(nil))
      end
    end
  end

  describe "POST create" do
    describe 'with data' do
      it 'return last id saved in database' do
        post :create, params: { value: 100, tax: 1, months: 3 }
        param = JSON.parse(response.body).with_indifferent_access
        expect(param[:loan][:id]).to(eq(Loan.order(:id).last.id))
      end
    end

    describe 'with no data or wrong data' do
      it 'return last id saved in database' do
        post :create
        param = JSON.parse(response.body).with_indifferent_access
        expect(param[:loan][:id]).to(eq(nil))
      end
    end
  end
end
