class AddValueToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :value, :integer
  end
end
