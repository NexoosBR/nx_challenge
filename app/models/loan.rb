class Loan < ApplicationRecord
  validates :taxa, presence: true, numericality: {greater_than: 0}
  validates :value, presence: true, numericality: {greater_than: 0}


  # def as_json(options={})
  #   super(root: true)
  # end

  def calculate
    taxa = self.taxa/100
    a = (taxa + 1)**12
    pmt = self.value * ((a * taxa)/(a - 1))
    self.pmt = pmt.to_f
  end

end
