class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.references :customer, null: false, foreign_key: true
      t.decimal :amount, precision: 14, scale: 2, null: false
      t.decimal :monthly_rate, precision: 9, scale: 4, null: false
      t.integer :months, null: false
      t.decimal :installment, precision: 14, scale: 2, null: false

      t.timestamps
    end
  end
end
