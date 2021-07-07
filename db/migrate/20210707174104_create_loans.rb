class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :amount
      t.float :tax
      t.integer :time
      t.float :pmt

      t.timestamps
    end
  end
end
