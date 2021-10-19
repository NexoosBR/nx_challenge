module PMT
  class Loans

	# initialize the class with value and fee to be used in class
    def initialize(value, fee, months)
      @value = value
      @fee = fee / 100
      @months = months
    end

    def calculate
      i = @fee
      n = @months
      pv = @value

      result = (pv * ((i * ((1 + i)**n)) / (((1 + i)**n) - 1)))
      sprintf("%.2f", result)
    end
  end
end
