class LoansController < ApplicationController
    def create
        loan = Loan.new(loan_params)
        if loan.valid?
            loan.save
            render json: {loan: loan.id}, status: :created
        else
            render json: {errors: loan.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
      loan = Loan.find_by_id(params[:id])
      if loan
         pmt = loan.pmt
         render json: {loan: loan.id, pmt: pmt}, status: :ok
      else
         render json: {error: "loan not found"}, status: :not_found
      end
    end

end
