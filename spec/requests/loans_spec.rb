require 'rails_helper'

RSpec.describe "Loans", type: :request do
  let!(:cliente) { create(:cliente) }
  let(:headers) do
    {
      'Content-Type' => Mime[:json].to_s
    }
  end

  describe "GET /loans/:id" do
    context "buscando loan" do
      let(:loan) { create(:loan, :gerado, cliente_id: cliente.id) }

      before {get "/loans/#{loan.id}", params: {}, headers: headers}

      it 'retornado status 200' do
        expect(response).to have_http_status(200)
      end

      it 'retornando pmt' do
        expect(json_body[:data][:attributes][:pmt]).not_to be_nil
      end
    end
  end
  
  describe "POST /loans" do
    before do
      post '/loans', params: { loan: loan_params }.to_json, headers: headers
    end

    context "criando loan com sucesso" do
      let(:loan_params) { attributes_for(:loan, :gerado, cliente_id: cliente.id) }
      
      it 'retornado status 201' do
        expect(response).to have_http_status(201)
      end

      it 'salva loan na base de dados' do
        expect( Loan.find(json_body[:data][:id]) ).not_to be_nil
      end

      it 'retornar json do loan criado' do
        expect(json_body[:data]).not_to be_nil
      end
    end

    context "criando loan sem sucesso" do
      let(:loan_params) { attributes_for(:loan, :gerado, cliente_id: cliente.id, meses: 0) }

      it 'retornado status 422' do
        expect(response).to have_http_status(422)
      end

      it 'não retornar json do loan criado' do
        expect( json_body[:data] ).to be_nil
      end
    end

  end
end
