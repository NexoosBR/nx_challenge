class RemovePmtFromLoans < ActiveRecord::Migration[6.1]
  def change
    remove_column :loans, :pmt, :integer
  end
end
