require "rails_helper"

RSpec.describe LoansController do
  describe 'POST /loans' do
    context 'with valid params' do
      let(:loan_params) { { value: 999.00, taxa: 2.00 } }

      it 'returns load id' do
        post :create, params: loan_params
        params = JSON.parse(response.body).with_indifferent_access
        expect(params[:loan][:id]).to eq(Loan.last.id)
      end

      it 'return status 200 - :ok' do
        post :create, params: loan_params
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:loan_params) { { value: 0, taxa: -1 } }

      it 'returns message errors' do
        post :create, params: loan_params
        loan = Loan.create(value: 0, rate: -99)
        params = JSON.parse(response.body).with_indifferent_access
        expect(params[:message][:errors]).to eq("Unable to create the loan")
      end

      it 'returns status 200 - :ok' do
        post :create, params: loan_params

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET /loans/:id' do
    before do
      Loan.create(value: 100, rate: 2.8)
    end

    context 'with valid params' do
      it 'returns load id' do
        get :show, params: { id: 1 }
        params = JSON.parse(response.body).with_indifferent_access

        expect(params[:loan]).to eq(
                                   {
                                     'id' => Loan.first.id,
                                     'pmt' => Loan.first.calculate_pmt.to_s
                                   }
                                 )
      end

      it 'returns status 200 - :ok' do
        get :show, params: { id: 1 }

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'returns message errors' do
        get :show, params: { id: 'x' }
        params = JSON.parse(response.body).with_indifferent_access

        expect(params[:message][:errors]).to eq("Loan not found")
      end

      it 'returns status 200' do
        get :show, params: { id: 1 }

        expect(response).to have_http_status(:ok)
      end
    end
  end
end