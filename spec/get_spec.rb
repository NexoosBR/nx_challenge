describe 'agrupando os metodos de verbo GET' do
 
    it 'testando show - buscando loans' do
        @loans = Loan.get('/loans/56')
        expect(@loans.code).to eq(200)
        puts @loans
    end
   
    it ' segundo teste - verificando um loans' do
        @loan = Loan.get('/loans/56')
        expect(@loan.code).to eq(200)
        expect(@loan['loan']['id']).to eq(56)
        expect(@loan['loan']['pmt']).to eq(248.12908)
    end
 



 end