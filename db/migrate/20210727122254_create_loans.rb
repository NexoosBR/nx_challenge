class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.belongs_to :client, null: false, foreign_key: true
      t.decimal :amount, null: false
      t.decimal :months, null: false
      t.decimal :rate, null: false
      t.decimal :pmt
      t.timestamps
    end
  end
end
