module Financial

  def pmt(pv, i, n)
    begin

      raise ArgumentError.new(
        "Expected a integer value, Parameter PV got #{pv}"
      ) unless pv.is_a? Integer
      raise ArgumentError.new(
        "Expected a integer value, Parameter N got #{n}"
      ) unless n.is_a? Integer
      raise ArgumentError.new(
        "Expected a float value with two decimal places, Parameter i got #{i}"
      ) unless max_two_decimal_places(i)

      return (pv*(
        (i*((1+i)^n))
        //
        ((1+i)^n - 1)
      )).round(2)

    rescue => e
      raise e
    end
  end

  private

  def max_two_decimal_places(i)
    begin
      return true if i.is_a? Integer
      arr = i.split('.')
      frac = arr[arr.size-1] # decimais
      return frac.length <= 2
    rescue => e
      raise e
    end
  end

end