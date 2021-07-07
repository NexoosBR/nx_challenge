require 'rails_helper'

RSpec.describe 'Loan Api', type: :request do

    let!(:loan){create(:loan)}
    
    context 'when send data to save loan' do
        describe 'POST /loans' do
            before {post "/loans", params: {value:200, tax:2.5, time:12}}

            it 'shound return saved loan id' do
                expect(response).to have_http_status(200)
                expect(response.body).to match('id')                
            end            
        end
    end

    context 'when send invalid data to save loan' do
        describe 'POST /loans' do
            before {post "/loans", params: {value:'', tax:'t', time:12}}

            it 'should return error message' do
                result_hash = JSON.parse(response.body, symbolize_names:true )
                expect(response.status).to eq(400)              
                expect(result_hash).to have_key(:error)              
            end           
        end
    end

    context 'when send no params to save loan' do
        describe 'POST /loans' do
            before {post "/loans"}

            it 'should return error message' do
                result_hash = JSON.parse(response.body, symbolize_names:true )
                expect(response.status).to eq(400)              
                expect(result_hash).to have_key(:error)              
            end           
        end
    end

    context 'when using invalid router' do
        describe 'POST /loans1' do
           
            it 'should return error router' do
                expect do
                 post "/loans1"
                end.to raise_error(ActionController::RoutingError)                  
             end     
        end
    end

  
    context 'when get loan information' do
        describe 'GET /loans' do
            before {get "/loans/#{loan.id}"}

            it 'shound return loan with pmt' do
                result_hash = JSON.parse(response.body, symbolize_names:true )
                
                expect(response).to have_http_status(200)
                expect(result_hash[:loan][:id]).to eq(loan.id)                
                expect(result_hash[:loan][:pmt]).to eq(loan.pmt)               
            end            
        end
    end

    context 'when get loan information using invalid id' do
        describe 'GET /loans' do
            before {get "/loans/-1"}

            it 'should return error message' do
                result_hash = JSON.parse(response.body, symbolize_names:true )
                expect(response.status).to eq(400)              
                expect(result_hash).to have_key(:error)               
            end            
        end
    end

    context 'when get loan information using invalid non numeric id' do
        describe 'GET /loans' do
            before {get "/loans/t"}

            it 'should return error message' do
                result_hash = JSON.parse(response.body, symbolize_names:true )
                expect(response.status).to eq(400)              
                expect(result_hash).to have_key(:error)               
            end            
        end
    end
    
   

end