class RemoveBirthdateFromClients < ActiveRecord::Migration[6.1]
  def change
    remove_column :clients, :birthdate, :date
  end
end
