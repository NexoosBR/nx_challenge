class CreateInstallments < ActiveRecord::Migration[6.1]
  def change
    create_table :installments do |t|
      t.integer :parcel_number
      t.decimal :parcel_price

      t.timestamps
    end
  end
end
