class Renameloanmonthratecolumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :loans, :montly_rate, :montly_rate_percent
  end
end
