class AddCustomerIdToLoan < ActiveRecord::Migration[6.1]
  def change
    add_reference :loans, :customer, null: false, foreign_key: true
  end
end
