class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :valor
      t.float :taxa
      t.integer :nprestacoes
      t.float :pmt

      t.timestamps
    end
  end
end
