class Requester < ApplicationRecord
  has_many :credits
  has_many :loans

  validates :name, :cnpj, :phone, :email, :commercial_address, :company_birth, presence: true
  
end
