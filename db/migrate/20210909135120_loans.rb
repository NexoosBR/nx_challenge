class Loans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :value, null: false
      t.decimal :tax, null: false
      t.decimal :pmt

      t.timestamps
    end
  end
end
