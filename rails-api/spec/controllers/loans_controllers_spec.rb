require "rails_helper" 

RSpec.describe LoansController do
  fixtures :loan

  describe "GET show" do
    it "Deve retornar um Loan" do
      get :show, params: { id: loan(:xpto).id }
      param = JSON.parse(response.body).with_indifferent_access
      expect(response).to have_http_status(200) 
      expect(param[:loan][:id]).to(eq(loan(:xpto).id))
    end

    it "Deve retornar uma resposta de corpo vazia e status 204" do
      get :show, params: { id: 999 }
      expect(response).to have_http_status(204) 
      expect(response.body.blank?).to(eq(true))
    end
  end

  describe "POST create" do
    
    it "Deve criar um Loan" do
      post :create, params: { 
        value:  loan(:xpto).value,
        taxa:   loan(:xpto).taxa,
        months: loan(:xpto).months }
      expect(response).to have_http_status(200) 
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:value]).to(eq(loan(:xpto).value))
      expect(param[:loan][:taxa]).to(eq(loan(:xpto).taxa))
      expect(param[:loan][:months]).to(eq(loan(:xpto).months))
    end

    it "Deve receber erros de validação | taxa deve ser maior que zero" do
      post :create, params: { 
        value:  loan(:xpto).value,
        taxa:   0,
        months: loan(:xpto).months }
      expect(response).to have_http_status(400) 
      errors = JSON.parse(response.body).with_indifferent_access
      expect(errors[:errors]).to(
        eq("Validation failed: Taxa must be greater than 0.0"))
    end

  end
end
