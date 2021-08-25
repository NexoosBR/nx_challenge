require 'rails_helper'

describe 'Loans API' do
  context 'GET /loans/:id' do
    it 'should return a loan' do
      loan = create(:loan, value: 999, rate: 2.8)
      other_loan = create(:loan, value: 999, rate: 3)

      get "/loans/#{loan.id}"

      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      expect(parsed_body[:loan][:id]).to eq(loan.id)
      expect(parsed_body[:loan][:id]).to_not eq(other_loan.id)
    end

    it 'cannot find a loan' do
      get '/loans/1'

      expect(response).to have_http_status(204)
      expect(response.body).to be_empty
    end
  end

  context 'POST /loans' do
    it 'should create a loan' do
      post '/loans', params: { loan: { value: 3700, rate: 2 } }

      expect(response).to have_http_status(201)
      expect(response.content_type).to include('application/json')
      expect(parsed_body[:loan][:id]).to eq(Loan.last.id)
    end

    it 'should not create a loan with invalid params' do
      post '/loans', params: { loan: { value: '' } }

      expect(response).to have_http_status(422)
      expect(response.content_type).to include('application/json')
      expect(parsed_body[:value]).to include('não pode ficar em branco')
      expect(parsed_body[:value]).to include('não pode ficar em branco')
    end

    it 'should only accept numbers as parameters' do
      post '/loans', params: { loan: { value: 'abc', rate: 'def' } }

      expect(response).to have_http_status(422)
      expect(response.content_type).to include('application/json')
      expect(parsed_body[:value]).to include('não é um número')
      expect(parsed_body[:value]).to include('não é um número')
    end

    it 'and must not accept negative numbers' do
      post '/loans', params: { loan: { value: -234, rate: -8 } }

      expect(response).to have_http_status(422)
      expect(response.content_type).to include('application/json')
      expect(parsed_body[:value]).to include('deve ser maior que 0')
      expect(parsed_body[:value]).to include('deve ser maior que 0')
    end
  end
end
