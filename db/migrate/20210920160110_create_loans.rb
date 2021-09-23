class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :value
      t.decimal :taxa
      t.decimal :pmt, default: 0.0

      t.timestamps
    end
  end
end
