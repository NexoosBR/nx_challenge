# frozen_string_literal: true

class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :present_value
      t.decimal :tax
      t.decimal :payments
      t.integer :time, default: 12

      t.timestamps
    end
  end
end
