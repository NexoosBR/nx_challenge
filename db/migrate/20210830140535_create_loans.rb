class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :amount
      t.integer :installments
      t.float :rate
      t.decimal :pmt

      t.timestamps
    end
  end
end
