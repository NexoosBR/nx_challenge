require "rails_helper" 

RSpec.describe 'Routes', type: :request do
  describe "NotFound(404)" do
    context "Acessando um end-point que não existe" do
      it "Faz a requisição e recebe status 404 e corpo de resposta vazio" do
        post '/xpto', params: { msg: 'tem alguém ai?' }
        expect(response).to have_http_status(404) 
        expect(response.body.blank?).to(eq(true))
      end
    end
  end
end