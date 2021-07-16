class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.references :client, null: false, foreign_key: true
      t.float :amount
      t.integer :months
      t.float :rate, precision: 2

      t.timestamps
    end
  end
end
