class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.text :email, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
