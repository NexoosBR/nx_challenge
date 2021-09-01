class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :present_value, precision: 10, scale: 2
      t.decimal :rate, precision: 10, scale: 2
      t.integer :period
      t.decimal :amount, precision: 10, scale: 1

      t.timestamps
    end
  end
end
