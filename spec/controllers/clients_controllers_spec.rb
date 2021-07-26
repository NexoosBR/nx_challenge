require "rails_helper" 

describe ClientsController, type: :controller do
  let(:client) { create(:client) }
  let(:client_params) { build(:client).attributes }

  it 'create a new client' do
    post :create, params: { client: client_params }
    expect(response).to have_http_status(:created)
  end

  it 'update client' do
    post :update, params: { id: client.id, client: { full_name: 'Thiago Magalhães' } }
    expect(response).to have_http_status(:ok)
    expect(response.parsed_body['full_name']).to eq('Thiago Magalhães')
  end

  it 'destroy client' do
    delete :destroy, params: { id: client.id }
    expect(response).to have_http_status(:no_content)
  end
end
