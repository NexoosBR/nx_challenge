class Client < ApplicationRecord
  validates :name, uniqueness: { case_insensitive: false }, length: { minimum: 3, maximum: 75 }, presence: true
  validates :email, uniqueness: { case_insensitive: false }, email: true, length: { minimum: 5, maximum: 60 }, presence: true
  validates :nickname, uniqueness: { case_insensitive: false }, length: { minimum: 3, maximum: 20 }, presence: false

  has_many :loans, dependent: :destroy
end