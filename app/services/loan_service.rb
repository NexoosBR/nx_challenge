# frozen_string_literal: true

class LoanService
  def find_loan_by_id(id)
    LoanRepository.new.find_loan_by_id(id)
  end

  def create_loan(params)
    object = {
      present_value: params["present_value"],
      tax:           params["tax"],
      payments:      pmt(params["present_value"].to_d, params["tax"].to_d, 12)
    }
    LoanRepository.new.create_loan(object)
  end

  def pmt(present_value, tax, time)
    monthly_tax = (tax / 100)
    exponential_tax = (1 + monthly_tax)**time
    result = present_value * (monthly_tax * exponential_tax) / (exponential_tax - 1)
    result.round(2)
  end
end
