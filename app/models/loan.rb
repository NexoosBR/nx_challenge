class Loan < ApplicationRecord
  validates :valor, presence: true, numericality: true
  validates :taxa, presence: true, numericality: true
  validates :nprestacoes, presence: true, numericality: { only_integer: true }

  def calculapmt
    calcular
  end

  private
  def calcular
    pmt = (valor * (taxa/100) * (1 + taxa/100) ** nprestacoes) / (((1 + taxa/100) ** nprestacoes) - 1)
    self.pmt = pmt.round(2)
  end
end
