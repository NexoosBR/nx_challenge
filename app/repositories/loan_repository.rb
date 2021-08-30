# frozen_string_literal: true

class LoanRepository < Loan
  def find_loan_by_id(id)
    loan = Loan.where(id: id)
    loan.first.presence
  end

  def create_loan(loan)
    Loan.create(loan)
  end
end
