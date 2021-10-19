class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :value
      t.float :fee
      t.integer :months

      t.timestamps
    end
  end
end
