class ApiKey < ApplicationRecord
  validates :key, :remote_ip, presence: true

  before_validation :define_key

  private

  def define_key
    self.key = SecureRandom.hex
  end
end
