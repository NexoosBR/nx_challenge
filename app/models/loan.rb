# frozen_string_literal: true

class Loan < ApplicationRecord
  validates :present_value, :tax, presence: true
  validates :tax, :present_value, numericality: {greater_than_or_equal_to: 0.1, only_decimal: true}
end
