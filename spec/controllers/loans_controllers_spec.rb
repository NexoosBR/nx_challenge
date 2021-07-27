require "rails_helper" 

RSpec.describe LoansController do
  render_views
  let!(:client) { create(:client) }

  describe "index" do
    context 'with loans' do
      let!(:loan) { create(:loan, client: client) }

      it 'list all' do
        get :index, params: { client_id: client.id }, format: :json

        expect(assigns(:client)).to eq client
        expect(assigns(:loans)).to eq [loan]
        expect(response).to render_template(:index)
      end
    end
  end

  describe "create" do
    context 'with valid params' do
      let(:params) do 
        {
          client_id: client.id,
          loan: {
            amount: 2500,
            number_of_months: 5,
            monthly_fee: 1.5
          }
        }
      end

      it 'returns the right data' do
        post :create, params: params, format: :json
        
        param = JSON.parse(response.body).with_indifferent_access
        expect(param[:loan][:amount]).to eq("2500.0")
      end

      it 'saves successfully' do
        expect {
          post :create, params: params, format: :json
        }.to change(Loan, :count).from(0).to(1)
      end
    end
  end

  describe "show" do
    context 'with valid params' do
      let!(:loan) { create(:loan, client: client) }
      let(:params) do 
        {
          client_id: client.id,
          id: loan.id
        }
      end

      it 'returns the right data' do
        post :show, params: params, format: :json
        
        param = JSON.parse(response.body).with_indifferent_access
        expect(param[:loan][:id]).to eq loan.id
        expect(param[:loan][:pmt]).to eq '522.72'
      end
    end
  end
end
