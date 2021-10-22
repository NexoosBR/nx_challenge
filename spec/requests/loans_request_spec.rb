require 'rails_helper'

RSpec.describe Loan, type: :request do
  describe 'POST /loans' do
    context "com parâmetros válidos" do
      valid_params = { value: 5000, months: 12, fee: 10 }
      it 'deve retornar status 200' do
        post loans_path, params: valid_params
        
        expect(response).to have_http_status(:ok)
      end
    end
    
    context "com parâmetros inválidos" do
      invalid_params = { value: 'string', months: 12, fee: 10 }
      it 'deve retornar status 500' do
        post loans_path, params: invalid_params

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /loan/:id' do
    context "com parâmetros válidos" do
      loan = Loan.create(value: 5000, months: 12, fee: 10)
      it 'deve retornar status de sucesso' do
        get loan_path(loan)
        
        expect(response).to have_http_status(:success)
      end

      it 'resposta deve ter key loan' do
        get loan_path(loan)
        info = JSON.parse(response.body)
        expect(info).to have_key('loan')
      end

      it 'resposta deve conter id' do
        get loan_path(loan)
        loan_hash = JSON.parse(response.body)['loan']
        expect(loan_hash).to have_key('id')
      end

      it 'resposta deve conter pmt' do
        get loan_path(loan)
        loan_hash = JSON.parse(response.body)['loan']
        expect(loan_hash).to have_key('pmt')
      end
    end
    
    # context "com parâmetros inválidos" do
    #   invalid_params = { value: 'string', months: 12, fee: 10 }
    #   it 'deve retornar status 500' do
    #     post loans_path, params: invalid_params

    #     expect(response).to have_http_status(:unprocessable_entity)
    #   end
    # end
  end
end