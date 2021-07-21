gem 'cpf_cnpj'

class Client < ApplicationRecord
    has_many :loans

    validates :name, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'invalid email'}
    validates :phone, presence: true
    validates :cpf, uniqueness: true

    validate :isCpfValid?

    def isCpfValid?
        if not CPF.valid? self.cpf
            errors.add(:cpf, "invalid")
        end
    end
end
