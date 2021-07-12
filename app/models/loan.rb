class Loan < ApplicationRecord

  validates_presence_of :value, :tax, :months
  validates_numericality_of :value, greater_than: 0
  validates_numericality_of :tax, greater_than_or_equal_to: 0
  validates_numericality_of :months, greater_than: 0

  before_create :calculate_pmt

  def calculate_pmt
    if self.value == 0 || self.months == 0
      self.pmt = 0
    else
      if self.tax > 0
        i = self.tax / 100
        z = (1 + i) ** self.months
        self.pmt = (self.value * ( i * z  / (z - 1 ))).round(2)
      else
        self.pmt = self.value / self.months
      end
    end
  end
end
