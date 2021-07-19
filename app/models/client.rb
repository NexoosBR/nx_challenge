class Client < ApplicationRecord
    has_many :loans

    validates :full_name, :email, presence: true
    validates :email, uniqueness: true, format: {with: /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i, message: "is not a valid email address"}
end
