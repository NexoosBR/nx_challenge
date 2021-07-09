class Customer < ApplicationRecord
  has_many :loans, dependent: :restrict_with_error

  validates :document, presence: :true, uniqueness: true, length: { maximum: 18 }
  validates :full_name, presence: :true, length: { maximum: 255 }
end
