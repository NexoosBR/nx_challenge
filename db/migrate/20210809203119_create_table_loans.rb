class CreateTableLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :pmt
      t.float :monthly_fee
      t.float :total_value
      t.integer :number_of_months

      t.timestamps
    end
  end
end
