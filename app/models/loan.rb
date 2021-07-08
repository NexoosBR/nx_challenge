class Loan < ApplicationRecord
  validates :finance, :tax, :months, :parcel, presence: true
end
