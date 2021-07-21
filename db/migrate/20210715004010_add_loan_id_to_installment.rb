class AddLoanIdToInstallment < ActiveRecord::Migration[6.1]
  def change
    add_reference :installments, :loan, null: false, foreign_key: true
  end
end
