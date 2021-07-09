class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :document, limit: 18, null: false, index: { unique: true }
      t.string :full_name, null: false

      t.timestamps
    end
  end
end
