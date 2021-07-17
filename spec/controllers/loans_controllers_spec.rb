require "rails_helper" 

RSpec.describe LoansController do

  describe "GET show" do
    it 'when get by id 1' do
      client = Client.create!(
        first_name: 'Rafael',
        last_name: 'Carrilho', 
        email: 'rafael@email.com', 
        document: '111.111.111-11',
        birthdate: '2000-02-16'
      )
      Loan.create(amount: 10000, rate: 0.2, months: 12, client: client)
    
      get :show, params: { id: 1 }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to eq(1)
    end
  end

  describe "POST show" do
    it do
      client = Client.create!(
        first_name: 'Rafael',
        last_name: 'Carrilho', 
        email: 'rafael@email.com', 
        document: '111.111.111-11',
        birthdate: '2000-02-16'
      )
      post :create, params: { loan: {
        client_id: client.id,
        amount: 10000.0,
        months: 12,
        rate: 0.2
        }
      }
      param = JSON.parse(response.body).with_indifferent_access
      expect(response).to have_http_status(:success)
      expect(param[:loan][:id]).to eq(2)
    end
  end
end
