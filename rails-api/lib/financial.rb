module Financial
  module Formulas

    def pmt(pv, i, n, dp = 2)
      begin
        raise ArgumentError.new(
          "Expected a integer value, Parameter PV got #{pv}"
        ) unless pv.is_a? Integer
        raise ArgumentError.new(
          "Expected a integer value, Parameter Months got #{n}"
        ) unless n.is_a? Integer
        raise ArgumentError.new(
          "Expected a float value with two decimal places, Parameter Taxa got #{i}"
        ) unless max_decimal_places(i, dp)

        return (pv*((i*((1+i)**n)) / (((1+i)**n) - 1))).round(dp)
  
      rescue => e
        raise e
      end
    end

    def to_decimal(i, dp = 2)
      begin
        raise ArgumentError.new(
          "Expected a integer or float value, got #{i}"
        ) unless is_number? i
        return ((i / 100).to_f).round(dp)
      rescue => e
        raise e
      end
    end

    private
  
    def max_decimal_places(i, dp = 2)
      begin

        raise ArgumentError.new(
          "Expected a integer or float value, got #{i}"
        ) unless is_number? i

        return true if i.is_a? Integer

        arr = i.to_s.split('.')
        frac = arr[arr.size-1] # decimais
        return frac.length <= dp
      rescue => e
        raise e
      end
    end
  end

  def is_number? x
    x = x.to_s
    true if Integer(x) rescue false
  end

end