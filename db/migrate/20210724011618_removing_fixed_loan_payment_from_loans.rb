class RemovingFixedLoanPaymentFromLoans < ActiveRecord::Migration[6.1]
  def change
    remove_column :loans, :fixed_loan_payment, if_exists: true
  end
end
