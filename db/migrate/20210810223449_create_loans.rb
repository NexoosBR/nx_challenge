class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :value
      t.float :fee
      t.float :pmt
      t.integer :months
      t.datetime :created_at, null: false
    end
  end
end
