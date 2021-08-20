class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :amount, null: false
      t.float :rate, null: false
      t.integer :installments, null: false, default: 12

      t.timestamps
    end
  end
end
