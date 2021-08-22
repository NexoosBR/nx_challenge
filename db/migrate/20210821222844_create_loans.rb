class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :financed_amount
      t.float :rate
      t.integer :months
      t.float :pmt

      t.timestamps
    end
  end
end
