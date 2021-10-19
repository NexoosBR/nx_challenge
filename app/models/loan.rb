class Loan < ApplicationRecord
  def calculate
    pmt = PMT::Loans.new(self.value, self.fee, self.months)
    pmt.calculate
  end
end
