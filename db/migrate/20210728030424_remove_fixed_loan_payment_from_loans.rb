class RemoveFixedLoanPaymentFromLoans < ActiveRecord::Migration[6.1]
  def change
    remove_column :loans, :fixed_loan_payment, :decimal
  end
end
