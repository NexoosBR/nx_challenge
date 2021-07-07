require 'rails_helper'

RSpec.describe "Loan Math Test" do

    
    describe 'Loan PMT Calcule' do
        
        it 'pmt should be' do
            expect(LoanMath.pmt(999, 2.8, 12)).to eq(99.17)                  
        end      

    end
    

end