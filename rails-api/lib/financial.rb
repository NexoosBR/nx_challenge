module Financial

  def self.pmt(pv, i, n)
    begin
      raise ArgumentError.new(
        "Expected a integer value, Parameter PV got #{pv}"
      ) unless pv.is_a? Integer
      raise ArgumentError.new(
        "Expected a integer value, Parameter Months got #{n}"
      ) unless n.is_a? Integer
      raise ArgumentError.new(
        "Expected a float value with two decimal places, Parameter Taxa got #{i}"
      ) unless max_decimal_places(i)

      return (pv*((i*((1+i)**n)) / (((1+i)**n) - 1))).round(2)

    rescue => e
      raise e
    end
  end

  def self.percent_to_decimal(i)
    begin
      raise ArgumentError.new(
        "Expected a integer or float value, got #{i}"
      ) unless is_number? i
      return (i.to_f / 100).round(4)
    rescue => e
      raise e
    end
  end

  private

  def self.max_decimal_places(i)
    begin

      raise ArgumentError.new(
        "Expected a integer or float value, got #{i}"
      ) unless is_number? i

      return true if i.is_a? Integer

      arr = i.to_s.split('.')
      frac = arr[arr.size-1] # decimais
      return frac.length <= 4
    rescue => e
      raise e
    end
  end

  def self.is_number? i
    i = i.to_s
    true if Float(i) rescue false
  end

end