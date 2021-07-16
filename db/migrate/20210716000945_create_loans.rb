class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :value, precision: 12, scale: 2
      t.integer :installments
      t.decimal :pmt, precision: 12, scale: 2
      t.decimal :rate, precision: 4, scale: 2

      t.timestamps
    end
  end
end
