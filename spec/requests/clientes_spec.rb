require 'rails_helper'

RSpec.describe "Clientes", type: :request do
  let(:headers) do
    {
      'Content-Type' => Mime[:json].to_s
    }
  end

  describe "GET /clientes" do
    context 'quando busca os clientes' do
      before do
        create_list(:cliente, 5)
        get '/clientes', params: {}, headers: headers
      end


      it 'retornado status 200' do
        expect(response).to have_http_status(200)
      end

      it 'retornar 5 da base de dados' do
        expect(json_body[:data].count).to eq(5)
      end
    end
  end

  describe "GET /clientes/:id" do
    let(:cliente) { create(:cliente) }

    before { get "/clientes/#{cliente.id}", params: {}, headers: headers }
   
    it 'retornado status 200' do
      expect(response).to have_http_status(200)
    end

    it 'retorno do json do cliente' do
      expect(json_body[:data][:attributes][:cpf]).to eq(cliente.cpf)
    end
  end

  describe "POST /clientes" do
    before do
      post '/clientes', params: { cliente: cliente_params }.to_json, headers: headers
    end

    context 'quando os parametros são validos' do
      let(:cliente_params) { attributes_for(:cliente) }
      
      it 'retornado status 201' do
        expect(response).to have_http_status(201)
      end

      it 'salva cliente na base de dados' do
        expect( Cliente.find_by(cpf: cliente_params[:cpf]) ).not_to be_nil
      end

      it 'retornar json do cliente criado' do
        expect(json_body[:data][:attributes][:cpf]).to eq(cliente_params[:cpf])
      end

    end

    context 'quando os parametros são invalidos' do
      let(:cliente_params) { attributes_for(:cliente, cpf: '') }

      it 'retornado status 422' do
        expect(response).to have_http_status(422)
      end

      it 'não salva cliente na base de dados' do
        expect( Cliente.find_by(cpf: cliente_params[:cpf]) ).to be_nil
      end

    end
  end

  describe "PUT /clientes/:id" do
    let(:cliente) { create(:cliente) }
    before do
       put "/clientes/#{cliente.id}", params: {cliente: cliente_params }.to_json, headers: headers 
    end

    context 'when the params are valid' do
      let(:cliente_params) { {cpf: 'new cliente cpf'} }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'return jason data for the updated cliente' do
        expect(json_body[:data][:attributes][:cpf]).to eq(cliente_params[:cpf])
      end

      it 'update cliente in the database' do
        expect( Cliente.find_by(cpf: cliente_params[:cpf]) ).not_to be_nil
      end
    end

    context 'where the request params aren`t valid' do
      let(:cliente_params) { attributes_for(:cliente, cpf: '') }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'does not update the cliente on database' do
        expect( Cliente.find_by(cpf: cliente_params[:cpf]) ).to be_nil
      end

      
    end
  end

  describe "DELETE /clientes/:id" do
    let(:cliente) { create(:cliente) }
    before do
      delete "/clientes/#{cliente.id}", params: {}, headers: headers 
    end
    it 'retornado status 204' do
      expect(response).to have_http_status(204) 
    end
    
    it 'remover o cliente da base de dados' do
      expect{ Cliente.find( cliente.id ) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
