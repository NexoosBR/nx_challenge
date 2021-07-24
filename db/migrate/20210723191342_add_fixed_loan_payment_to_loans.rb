class AddFixedLoanPaymentToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :fixed_loan_payment, :decimal
  end
end
