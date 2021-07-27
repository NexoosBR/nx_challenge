class Loan < ApplicationRecord
  #Validations
  validates_presence_of :pmt, on: :save
  validates_numericality_of :pmt, greater_than: 0, on: :save
  validates_presence_of :value, :monthly_fee, :months
  validates_numericality_of :value, :monthly_fee, :months, greater_than: 0

  #Callbacks
  before_create :calculate_pmt

  ##
  # Calculates the PMT value as soon as the loan is created
  def calculate_pmt
    #Divides monthly fee by 100 and attributes the value to a temporary variable
    temp_monthly_fee = self.monthly_fee/100
    #Calculates power only once, as it's needed twice on the operation
    power = (1 + temp_monthly_fee)**self.months
    if power - 1 != 0
      self.pmt = (self.value * ((temp_monthly_fee * power) / (power - 1))).round(2)
    else
      errors.add :base, "Power can't be smaller than zero"
    end
  end
end
