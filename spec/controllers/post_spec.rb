describe 'agrupando os metodos de verbo POST' do
 

    it 'meu terceiro teste - adicionando loans' do
        @new_loan = {
             value: "1000.2",
             taxa: "0.2",
             number_of_months: "9.4",
             name: "maria"
        }
  
        @request = Loan.post('/loans', :body => @new_loan.to_json, :headers => { 'Content-Type' => 'application/json' })
        
        puts @request
        expect(@request.code).to eq(200)
        
        expect(@request['loan']['id']).to eq(@request['loan']['id'])
  
    end
  
 end