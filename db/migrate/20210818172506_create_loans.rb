class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :value
      t.float :rate
      t.integer :months
      t.references :client

      t.timestamps
    end
  end
end
