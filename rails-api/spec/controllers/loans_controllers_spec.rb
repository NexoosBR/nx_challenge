require "rails_helper" 

RSpec.describe LoansController do
  fixtures :loan

  describe "GET show" do

    context "Acessando o end-point /show/:id" do

      it "Retorna um Loan" do
        get :show, params: { id: loan(:xpto).id }
        param = JSON.parse(response.body).with_indifferent_access
        expect(response).to have_http_status(200) 
        expect(param[:loan][:id]).to(eq(loan(:xpto).id))
      end

      it "Não encontrou o Loan e retorna uma resposta de corpo vazio e status 204" do
        get :show, params: { id: 999 }
        expect(response).to have_http_status(204) 
        expect(response.body.blank?).to(eq(true))
      end

    end
  end

  describe "POST create" do

    context "Acessando o end-point /create" do
    
      it "Cria uma instancia de Loan e Retorna a instancia recém criada" do
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

    end

  end
end
