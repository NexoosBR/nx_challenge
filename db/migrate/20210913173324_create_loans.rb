class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :value
      t.float :tax
      t.integer :months
      t.float :pmt

      t.timestamps
    end
  end
end
