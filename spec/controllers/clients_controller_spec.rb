require "rails_helper" 

RSpec.describe ClientsController, type: :controller do
  render_views

  describe "index" do
    context 'with clients' do
      let!(:client) { create(:client) }

      it 'list all' do
        get :index, format: :json

        expect(assigns(:clients)).to eq [client]
        expect(response).to render_template(:index)
      end
    end
  end

  describe "create" do
    context 'with valid params' do
      let(:params) do 
        {
          client: {
            name: "Maria Joana",
            phone_number: "22998927365",
            cpf: "12345612378"
          }
        }
      end

      it 'returns the right data' do
        post :create, params: params, format: :json
        
        param = JSON.parse(response.body).with_indifferent_access
        expect(param[:client][:cpf]).to eq("12345612378")
      end

      it 'saves successfully' do
        expect {
          post :create, params: params, format: :json
        }.to change(Client, :count).from(0).to(1)
      end
    end
  end
end
