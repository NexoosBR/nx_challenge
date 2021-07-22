# frozen_string_literal: true

class Loan < ApplicationRecord
  # validacao para permitir apenas valores do tipo numero. Nao é permitido letras
  validates_numericality_of :value, :rate, :installment
  # validacao para campos em branco
  validates_presence_of :value, :rate, :installment
  # validacao para o limite de parcelas, no maximo 50
  validates_inclusion_of :installment, in: 1..50

  # funcao de calculo de pmt
  def self.calculation_pmt(param)
    pv = param.value # o valor
    i = param.rate # a taxa
    n = param.installment # o numero de parcelas

    pmt = pv / (((1 + i)**n - 1) / ((1 + i)**n * i))
    pmt.round(2)
  end
end
