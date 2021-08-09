class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.integer :instalment_number, default: 1
      t.decimal :pmt, default: 0, scale: 2, precision: 15
      t.decimal :amount, default: 0, scale: 2, precision: 15
      t.decimal :tax, default: 0, scale: 2, precision: 15
      t.date :due_date
      t.integer :period_type
      
      t.timestamps
    end
  end
end
