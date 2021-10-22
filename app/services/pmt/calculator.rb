module Pmt
  class Calculator
    attr_reader :value, :fee, :months

    def initialize(attributes = {})
      @value = attributes[:value]
      @fee = attributes[:fee]
      @months = attributes[:months]
    end

    # Método para chamar o objeto em outras classes
    def self.call(value, fee, months)
      new(value: value, fee: fee, months: months).calculate
    end

    # Método que calcula o valor de cada parcela
    def calculate
      pv = @value
      i = ('%.2f' % (@fee.to_d / 100)).to_d
      n = @months
      numerator = i * (1 + i)**n
      denominator = (1 + i)**n - 1
      pv * numerator / denominator
    end
  end
end