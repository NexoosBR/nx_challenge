class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :total_value
      t.integer :total_installment

      t.timestamps
    end
  end
end
