require "rails_helper" 

RSpec.describe LoansController do
  describe "GET show" do
    let!(:loan) { create(:loan) }
    it do
      get :show, params: { id: 1 }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(1))
    end
  end

  describe "POST show" do
    let(:loan_params) do 
      {
        loan: {
          months: 10,
          amount: 300,
          fee: 10
        }
      }
    end

    it 'loan saves' do
      expect {
        post :create, params: loan_params, format: :json
      }.to change(Loan, :count).from(0).to(1)
    end
  end
end
