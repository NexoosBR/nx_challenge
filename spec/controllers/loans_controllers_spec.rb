require "rails_helper" 

describe LoansController, type: :controller do
  let(:loan) { create(:loan) }
  let(:loan_params) { build(:loan).attributes }
  let(:client) { create(:client) }

  it 'create a new loan' do
    post 'create', params: { client_id: client.id, loan: loan_params }
    expect(response).to have_http_status(:created)
  end
end
