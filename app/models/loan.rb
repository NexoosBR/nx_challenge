class Loan < ApplicationRecord
  validates_presence_of :pv, :taxa_mensal, :meses, :cliente_id

  validates :meses, numericality: {greater_than: 0}
  
  belongs_to :cliente

  before_save :gera_pmt

  def gera_pmt   
    self.pmt = pv * ( taxa_mensal * ((1 + taxa_mensal) ** meses)) / (((1 + taxa_mensal) ** meses) - 1)
  end
end
