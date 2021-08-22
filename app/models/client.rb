# frozen_string_literal: true

class Client < ApplicationRecord
  validates :name, presence: true
  validates :client_type, presence: true
  validates :email, presence: true
  validates :telephone, presence: true
  validates :cpf_cnpj, presence: true, uniqueness: { case_sensitive: false }

  enum client_type: { physical: 'F', juridical: 'J' }
  validate :validate_cpf, if: -> { physical? }
  validate :validate_cnpj, if: -> { juridical? }

  has_many :loans, inverse_of: false

  private

  def validate_cpf
    errors.add(:cpf_cnpj) unless CPF.valid?(cpf_cnpj)
  end

  def validate_cnpj
    errors.add(:cpf_cnpj) unless CNPJ.valid?(cpf_cnpj)
  end
end
