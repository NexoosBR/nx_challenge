require "rails_helper"

controler_name = 'Loans'

RSpec.describe LoansController do
  let!(:client) { create(:client) }

  describe "#{controler_name} index" do
    let!(:loan) { create(:loan, client: client) }

    it 'deve listar corretamente' do
      get :index, params: { client_id: client.id, id: loan.id }

      expect(response.status).to be(200)
      expect(json_response.length).to be(1)
    end
  end

  describe "#{controler_name} show" do
    context 'com client existente' do
      let!(:loan) { create(:loan, client: client) }

      context 'com loan existente' do
        it 'deve exibir corretamente' do
          get :show, params: { client_id: client.id, id: loan.id }

          expect(response.status).to be(200)
          expect(json_response).to include(
            'value' => loan.value,
            'rate' => loan.rate,
            'months' => loan.months,
            'pmt' => loan.pmt,
          )
        end
      end

      context 'com loan inexistente' do
        it 'não deve exibir' do
          get :show, params: { client_id: client.id, id: loan.id + 1 }

          expect(response.status).to be(404)
        end
      end
    end

    context 'com client inexistente' do
      let!(:loan) { create(:loan, client: client) }

      it 'não deve exibir' do
        get :show, params: { client_id: client.id + 1, id: loan.id }

        expect(response.status).to be(404)
      end
    end
  end

  describe "#{controler_name} create" do
    context 'com parametos corretos' do
      let(:params) do
        {
          client_id: client.id,
          loan: {
            value: 2000,
            rate: 0.2,
            months: 12,
          }
        }
      end
  
      it 'deve criar corretamente' do
        post :create, params: params
  
        expect(response.status).to be(200)
        expect(json_response).to include(
          'value' => params[:loan][:value],
          'rate' => params[:loan][:rate],
          'months' => params[:loan][:months],
        )
      end
    end

    context 'com parametos incorretos' do
      let(:params) do
        {
          client_id: client.id,
          loan: {
            value: 2000,
            rate: 0.2,
          }
        }
      end
  
      it 'não deve criar' do
        post :create, params: params
  
        expect(response.status).to be(400)
      end
    end

    context 'com client inexistente' do
      let(:params) do
        {
          client_id: client.id + 1,
          loan: {
            value: 2000,
            rate: 0.2,
          }
        }
      end
  
      it 'não deve criar' do
        post :create, params: params
  
        expect(response.status).to be(404)
      end
    end
  end
end
