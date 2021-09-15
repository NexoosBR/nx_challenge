class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :value
      t.decimal :rate
      t.integer :installments

      t.timestamps
    end
  end
end
