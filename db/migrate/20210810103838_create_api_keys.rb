class CreateApiKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :api_keys do |t|
      t.string :remote_ip, default: '', null: false
      t.string :key, default: '', null: false
      
      t.timestamps
    end
  end
end
