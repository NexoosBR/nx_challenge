class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :taxa
      t.float :value
      t.float :pmt
      t.integer :number_of_months
      t.string :name

      t.timestamps
    end
  end
end
