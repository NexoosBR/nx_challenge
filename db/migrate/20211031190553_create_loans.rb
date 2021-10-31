class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.integer :months
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :fee, precision: 10, scale: 2

      t.timestamps
    end
  end
end
