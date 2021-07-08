class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :finance , null: false
      t.float :tax, null: false
      t.integer :months, null: false
      t.float :parcel, null: false

      t.timestamps
    end
  end
end
