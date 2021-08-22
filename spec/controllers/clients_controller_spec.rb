# frozen_string_literal: true

require 'rails_helper'

controler_name = 'Clients'

RSpec.describe ClientsController do
  describe "#{controler_name} index" do
    let!(:client) { create(:client) }

    it 'deve listar corretamente' do
      get :index

      expect(response.status).to be(200)
      expect(json_response.length).to be(1)
    end
  end

  context "#{controler_name} show" do
    context 'com client existente' do
      let!(:client) { create(:client) }

      it 'deve exibir corretamente' do
        get :show, params: { id: client.id }

        expect(response.status).to be(200)
        expect(json_response).to include(
          'name' => client.name,
          'client_type' => client.client_type,
          'cpf_cnpj' => client.cpf_cnpj,
          'email' => client.email,
          'telephone' => client.telephone,
        )
      end
    end

    context 'com client inexistente' do
      let!(:client) { create(:client) }

      it 'não deve exibir' do
        get :show, params: { id: client.id + 1 }

        expect(response.status).to be(404)
      end
    end
  end

  describe "#{controler_name} create" do
    context 'com parametos corretos' do
      let(:params) do
        {
          client: {
            name: 'Teste',
            client_type: 'physical',
            cpf_cnpj: '61425478034',
            email: 'teste@testes.com.br',
            telephone: '128782012344',
          }
        }
      end

      it 'deve criar corretamente' do
        post :create, params: params

        expect(response.status).to be(200)
        expect(json_response).to include(
          'name' => params[:client][:name],
          'client_type' => params[:client][:client_type],
          'cpf_cnpj' => params[:client][:cpf_cnpj],
          'email' => params[:client][:email],
          'telephone' => params[:client][:telephone],
        )
      end
    end

    context 'com parametos incorretos' do
      let(:params) do
        {
          client: {
            name: 'Teste',
            client_type: 'physical',
            email: 'teste@testes.com.br',
            telephone: '128782012344',
          }
        }
      end

      it 'não deve criar' do
        post :create, params: params

        expect(response.status).to be(400)
      end
    end

    context 'com cpf existente' do
      let!(:client) { create(:client) }
      let(:params) do
        {
          client: {
            name: 'Teste',
            client_type: 'physical',
            cpf_cnpj: client.cpf_cnpj,
            email: 'teste@testes.com.br',
            telephone: '128782012344',
          }
        }
      end

      it 'não deve criar' do
        post :create, params: params

        expect(response.status).to be(400)
      end
    end
  end
end
