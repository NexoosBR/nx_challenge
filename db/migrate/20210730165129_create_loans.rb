class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.integer :months, null: false
      t.float :monthly_tax, null: false
      t.decimal :amount, null: false, precision: 30, scale: 2
      t.decimal :pmt, null: false, precision: 30, scale: 2

      t.timestamps
    end
  end
end
