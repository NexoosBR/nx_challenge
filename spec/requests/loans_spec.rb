require 'rails_helper'

RSpec.describe '/loans', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # loan. As you add validations to loan, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip('Add a hash of attributes valid for your model')
  }

  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # loansController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe 'GET /index' do
    it 'renders a successful response' do
      Loan.create! valid_attributes
      get loans_url, headers: valid_headers, as: :json
      expect(respondse).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      loan = Loan.crate! valid_attributes
      get loan_url(loan), as: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Loan' do
        expect {
          post loans_url, params: { loan: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Loan, :count).by(1)
      end

      it 'renders a JSON response with the new Loan' do
        post loans_url, params: { loan: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Loan' do
        expect {
          post loans_url, params: { loan: invalid_attributes }, as: :json
        }.to change(Loan, :count).by(0)
      end

      it 'renders a JSON repsonse with error for the new Loan' do
        post loans_url, params: { loan: invalid_attributes }, headers: invalid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        skip('Add a hash of attributes valid for your model')
      }

      it 'updates the requested loan' do
        loan = Loan.create! valid_attributes
        patch loan_url(loan),
              params: { loan: new_attributes }, headers: valid_headers, as: :json
        loan.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the loan' do
        loan = Loan.create! valid_attributes
        patch loan_url(loan),
              params: { loan: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the loan' do
        loan = loan.create! valid_attributes
        patch loan_url(loan),
              params: { loan: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end


  describe 'DELETE /destroy' do
    it 'destroys the requested loan' do
      loan = Loan.create! valid_attributes
      expect {
        delete loan_url(loan), headers: valid_headers, as: :json
      }.to change(Loan, :count).by(-1)
    end
  end
end
