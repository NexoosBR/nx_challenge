class Loan < ApplicationRecord
  before_create :pmt_calc
  
  belongs_to :client
  
  validates :financed_amount, :rate, :months, :client, presence: true
  validates :financed_amount, numericality: { greater_than: 0, message: 'must be a positive number' }
  validates :rate, numericality: { greater_than: 0, less_than_or_equal_to: 100 , message: 'must be between 0 and 100' }
  validates :months, numericality: { greater_than: 0 , message: 'must be a positive number' }

  def pmt_calc
    (financed_amount * ((rate * ((1 + rate) ** months)) / ((1 + rate) ** months - 1))).floor
  end

  def as_json(options = {})
    {loan: {
      id: self.id,
      pmt_calc: self.pmt_calc, 
      financed_amount: self.financed_amount, 
      rate: self.rate,
      months: self.months,
      client: self.client
    }}
  end
end
