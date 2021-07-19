class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :financed_amount
      t.float :rate, precision: 2
      t.integer :months
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
