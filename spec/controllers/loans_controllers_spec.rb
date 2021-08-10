require "rails_helper" 

RSpec.describe LoansController do
  fixtures :loan

  describe "POST create" do

    context "Acessando o end-point /create" do
    
      it "Cria uma instancia de Loan e Retorna a instancia recém criada" do
        post :create, params: { 
          value:  loan(:xpto).value,
          taxa:   loan(:xpto).taxa,
          months: loan(:xpto).months }
        expect(response).to have_http_status(200) 
        param = JSON.parse(response.body).with_indifferent_access
        expect(param[:loan][:id]).to be_a_kind_of(Integer)
      end

    end

  end

  describe "GET show" do

    context "Acessando o end-point /show/:id" do

      it "Retorna um Loan" do
        get :show, params: { id: loan(:xpto).id }
        param = JSON.parse(response.body).with_indifferent_access
        expect(response).to have_http_status(200) 
        expect(param[:loan][:id]).to(eq(loan(:xpto).id))
        expect(param[:loan][:pmt]).to(eq(loan(:xpto).pmt))
      end

      it "Não encontrou o Loan e retorna uma resposta de corpo vazio e status 204" do
        get :show, params: { id: 99999999999 }
        expect(response).to have_http_status(204) 
        expect(response.body.blank?).to(eq(true))
      end

    end
  end

  describe "GET amortization" do

    context "Acessando o end-point /amortization/:id" do

      it "Retorna uma table de amortização" do
        ultimo_mes = loan(:xpto).months
        mes_zero = 0
        get :amortization_table, params: { id: loan(:xpto).id }
        param = JSON.parse(response.body).with_indifferent_access
        expect(response).to have_http_status(200)
        expect(param[:amortization].length - 1).to(eq(loan(:xpto).months))
        expect(param[:amortization][mes_zero][:balance]).to(eq(loan(:xpto).value))
        expect(param[:amortization][ultimo_mes][:balance].round(2)).to be_between(-0.05, 0.05)
      end

      it "Não encontrou o Loan e retorna uma resposta de corpo vazio e status 204" do
        get :amortization_table, params: { id: 99999999999 }
        expect(response).to have_http_status(204) 
        expect(response.body.blank?).to(eq(true))
      end

    end

  end


end
