class Cliente < ApplicationRecord
  validates_presence_of :nome, :email, :cpf, :telefone

  validates_uniqueness_of :cpf

  has_many :loans, dependent: :destroy
end
