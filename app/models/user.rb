class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum:2, maximum: 100}
  validates :last_name,presence: true, length: { minimum:2, maximum: 500}
  validates :cpf, presence: true,  length: { is: 11 }

  after_validation :downName

  private 

  def downName
    self.first_name = first_name.downcase
    self.last_name = last_name.downcase
  end
end
