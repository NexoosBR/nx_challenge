class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :value, precision: 10, scale: 2
      t.decimal :taxa, precision: 10, scale: 5
      t.decimal :pmt, precision: 10, scale: 2

      t.timestamps
    end
  end
end
