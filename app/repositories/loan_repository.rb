# frozen_string_literal: true

class LoanRepository < Loan
  def find_loan_by_id(id)
    Loan.find(id)
  end

  def create_loan(loan)
    new_loan = Loan.new
    new_loan.present_value = loan["present_value"]
    new_loan.tax = loan["tax"]
    new_loan.time = loan["time"] unless loan["time"] == 12
    new_loan.save!

    new_loan
  end
end
