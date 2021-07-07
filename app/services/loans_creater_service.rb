class LoansCreaterService < ApplicationService

    attr_reader :amount, :tax, :time_in_months

    def initialize(params)
        @amount = params[:value] 
        @tax = params[:tax]
        @time_in_months = params[:time]        
    end

    # Service that calcule and include a new PMT
    def call     

        raise StandardError, "Invalid Parameters" unless params_valid

        pmt = LoanMath.pmt(@amount.to_f, @tax.to_f, @time_in_months.to_i)
        loan = Loan.new(amount:@amount, tax:@tax, time:@time_in_months, pmt:pmt)
        loan.save!

        { loan: { id: loan.id } }
    end

    private 

    #Check with all paremeters are numeric
    def params_valid
        @amount.numeric? && @tax.numeric? && @time_in_months.numeric?
    end

end