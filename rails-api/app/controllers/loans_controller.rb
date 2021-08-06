class LoansController < ApplicationController
  def create
    value = params[:value]
    taxa = params[:taxa]
    months = params[:months]
    loan = create_a_loan(value, taxa, months)
    render json: { loan: {id: loan.id} }
  end

  def show(id)
    begin
      raise ArgumentError.new(
        "Expected a integer value, Parameter id got #{id}"
      ) unless id.is_a? Integer
      loan = Loan.find(id)
      render json: { loan: {id:loan.id, pmt:loan.pmt} }
    rescue => e
      Rails.logger.info e
      render body:nil, status: 500
    end
  end

  def create_a_loan(value, taxa, months)
    begin
      loan = Loan.new({
        :value  = value
        :taxa 	= taxa
        :months	= months
      })
      end
      loan.save
      return loan
    rescue => e
      raise e
    end
  end
end
