class Loan < ApplicationRecord
  belongs_to :client
  validates :amount, :client, :months, :rate, presence: true
  validates :amount, :months, :rate, numericality: {greater_than_or_equal_to: 0}

  def pmt
    (amount * ((rate * ((1 + rate)**months)) / ((1 + rate)**months - 1))).floor
  end

  def as_json(options = {})
    {loan: {
      id: self.id,
      pmt: self.pmt, 
      amount: self.amount, 
      rate: self.rate,
      client: self.client 
    }}
  end

end
