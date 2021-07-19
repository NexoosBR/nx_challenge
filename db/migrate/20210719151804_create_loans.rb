class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :financed_amount
      t.float :monthly_fee
      t.integer :monthly_payments
      t.decimal :payments_value

      t.timestamps
    end
  end
end
