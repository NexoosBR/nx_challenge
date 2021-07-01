class AddTaxaToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :taxa, :float
  end
end
