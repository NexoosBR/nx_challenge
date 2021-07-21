class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|

      t.decimal :value, precision: 13, scale: 2
      t.integer :months
      t.float :rate
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
