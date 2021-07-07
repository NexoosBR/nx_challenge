class LoansShowService < ApplicationService

    attr_reader :id

    def initialize(params)
        @id = params[:id] 
        
    end

    # Service that search in the database the loan an return it
    def call     

        loan = Loan.find(@id)
        raise StandardError, "Loan not found with id #{@id}" unless loan

        { loan: { id: loan.id, pmt: loan.pmt } }
    end

  
  

end