class Credit < ApplicationRecord
  belongs_to :requester
  has_many :loans

  validates :amount, presence: true
end
