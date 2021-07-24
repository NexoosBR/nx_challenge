class ChangeDecimalTypesFromLoans < ActiveRecord::Migration[6.1]
  def change
    change_column :loans, :loan_amount, :decimal, scale: 5, precision: 10
    change_column :loans, :interest_rate, :decimal, scale: 5, precision: 8
    change_column :loans, :fixed_loan_payment, :decimal, scale: 3, precision: 10
  end
end
