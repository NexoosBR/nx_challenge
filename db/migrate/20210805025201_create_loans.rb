class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :present_value
      t.float :rate
      t.integer :periods
      t.float :pmt

      t.timestamps
    end
  end
end
