class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.integer :quantity, null: false
      t.float :taxa, null: false
      t.float :value, null: false
      t.float :pmt

      t.timestamps
    end
  end
end
