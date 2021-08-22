# frozen_string_literal: true

class Loan < ApplicationRecord
  validates :value, presence: true
  validates :rate, presence: true
  validates :months, presence: true

  belongs_to :client, inverse_of: false

  def pmt
    i = rate / 100
    value * ((i * ((1 + i)**months)) / (((1 + i)**months) - 1))
  end
end
