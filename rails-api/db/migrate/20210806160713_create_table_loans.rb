class CreateTableLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.integer :value,  null: false
      t.integer :months, null: false
      t.float   :taxa,   null:false

      t.timestamps
    end
  end
end
