class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :pmt, precision: 10, scale: 2
      t.decimal :pv, precision: 10, scale: 2
      t.decimal :taxa_mensal, precision: 5, scale: 4
      t.integer :meses
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
