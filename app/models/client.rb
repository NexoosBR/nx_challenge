class Client < ApplicationRecord
  validates :name, :cpf, :phone_number, presence: true
  validates :cpf, uniqueness: true

  has_many :loans
end
