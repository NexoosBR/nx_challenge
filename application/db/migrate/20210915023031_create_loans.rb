class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :value
      t.decimal :rate
      t.string :installments
      t.string :integer

      t.timestamps
    end
  end
end
