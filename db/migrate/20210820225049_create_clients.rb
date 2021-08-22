class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :client_type
      t.string :email
      t.string :telephone
      t.string :cpf_cnpj

      t.index :cpf_cnpj, unique: true

      t.timestamps
    end
  end
end
