class AddDefaultValuesFromLoans < ActiveRecord::Migration[6.1]
  def change
    change_column :loans, :period_type, :integer, default: 0
    change_column :loans, :loan_start_date, :datetime, default: DateTime.now
  end
end
