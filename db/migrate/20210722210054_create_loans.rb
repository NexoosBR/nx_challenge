class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :loan_amount
      t.float :interest_rate
      t.integer :period
      t.integer :period_type
      t.datetime :loan_start_date
      t.belongs_to :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
