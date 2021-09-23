require 'rails_helper'

describe 'Loans' do
  before do
    @loan = Loan.create(value: 999, taxa: 2.8)
    @other_loan = Loan.create(value: 999, taxa: 3)
  end
  context 'GET /loans/:id' do
    it 'should return a loan' do
      get show_loan_path(@loan.id)
      expect(response.content_type).to include('application/json')
      expect(response).to have_http_status(200)
    end

    it 'cannot find a loan' do
      get show_loan_path(id: 99)
      
      expect(response).to have_http_status(404)
    end
  end

  context 'POST /loans' do
    it 'should create a loan' do
      post create_loan_path, params: { loan: { value: 3700, taxa: 2 } }
      expect(response.content_type).to include('application/json')
      expect(response).to have_http_status(201)
    end

    it 'should not create a loan with invalid params' do
      post create_loan_path, params: { loan: { value: '' } }

      expect(response).to have_http_status(422)
    end

    it 'should only accept numbers as parameters' do
      post create_loan_path, params: { loan: { value: 'abc', taxa: 'def' } }

      expect(response).to have_http_status(422)
    end

    it 'and must not accept negative numbers' do
      post create_loan_path, params: { loan: { value: -234, taxa: -8 } }

      expect(response).to have_http_status(422)
    end
  end
end
