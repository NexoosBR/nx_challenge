class Customer < ApplicationRecord
  validates :document, presence: :true, uniqueness: true, length: { maximum: 18 }
  validates :full_name, presence: :true, length: { maximum: 255 }
end
