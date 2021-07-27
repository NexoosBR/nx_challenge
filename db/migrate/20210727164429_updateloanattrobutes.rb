class Updateloanattrobutes < ActiveRecord::Migration[6.1]
  def change
    rename_column :loans, :rate, :montly_rate_percent
    change_column :loans, :months, :integer
  end
end
