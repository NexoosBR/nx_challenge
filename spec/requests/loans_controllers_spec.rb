require "rails_helper" 

RSpec.describe V1::LoansController, type: :request do
  let(:loan) { FactoryBot.create :loan, pmt: 52.52 }

  describe "GET show" do
    it 'requisita dados de um determinado emprestimo' do
      get v1_loan_path(loan.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(loan.pmt.to_s)
    end
  end

  describe "POST show" do
    it 'cria emprestimo com sucesso' do
      post v1_loans_path, params: { valor: 200, taxa: 2, nprestacoes: 5 }
      expect(response).to have_http_status(:created)
      expect(response.body).to include('1')
    end

    it 'falha ao criar emprestimo' do
      post v1_loans_path, params: { valor: 'falha', taxa: 2, nprestacoes: 5 }
      expect(response).not_to have_http_status(:created)
      expect(response.body).to include('errors')
    end
  end
end