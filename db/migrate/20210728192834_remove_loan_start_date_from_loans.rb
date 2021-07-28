class RemoveLoanStartDateFromLoans < ActiveRecord::Migration[6.1]
  def change
    remove_column :loans, :loan_start_date, :datetime
  end
end
