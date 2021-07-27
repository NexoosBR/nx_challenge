class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.integer :number_of_months
      t.decimal :monthly_fee, precision: 10, scale: 2
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
