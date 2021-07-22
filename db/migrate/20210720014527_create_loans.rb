# frozen_string_literal: true

class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.integer :value
      t.float :rate
      t.integer :installment

      t.timestamps
    end
  end
end
