class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :value, precision: 18, scale: 2
      t.decimal :tax, precision: 4, scale: 2
      t.integer :months
      t.decimal :pmt, precision: 18, scale: 2

      t.timestamps
    end
  end
end
