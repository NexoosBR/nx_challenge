class RemovePeriodTypeFromLoans < ActiveRecord::Migration[6.1]
  def change
    remove_column :loans, :period_type, :integer
  end
end
