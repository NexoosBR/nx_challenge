module LoanMath

    # Calculate PMT
    #
    # params [:amount, :tax, :time_in_months]
    def self.pmt(amount, tax, time_in_months)

        tax_converted = (tax/100)
        exp_part = (1+tax_converted)**time_in_months

        result = amount*(tax_converted*exp_part)/(exp_part - 1)

        result.round(2)

    end

end