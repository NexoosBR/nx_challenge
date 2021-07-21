class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :rate, precision: 5, scale: 2
      t.integer :months_period
      t.decimal :value, precision: 10, scale: 2
      t.decimal :pmt, precision: 10, scale: 2

      t.timestamps
    end
  end
end
