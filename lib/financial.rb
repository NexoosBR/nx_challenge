module Financial

  def self.amortization(loan = {})
    begin
      raise ArgumentError.new(
        "Expected a Loan Object, Parameter loan got #{loan.class}"
      ) unless loan.present? && loan.class == Loan
      i = 0
      table = []
      while(true) do
        table.push(
          {valor: nil,
          taxa: nil,
          amortized: nil,
          balance: loan.value}) if i.zero?

        table.push(
          {valor: loan.pmt,
          juros: juros(table[i-1][:balance], loan.taxa),
          amortized: amortized(juros(table[i-1][:balance], loan.taxa), loan.pmt),
          balance: balance(
            table[i-1][:balance], 
            amortized(
              juros(
                table[i-1][:balance], 
                loan.taxa),
              loan.pmt))}) unless i.zero?

        break if i == loan.months
        i+=1
      end
      return table
    rescue => e
      raise e
    end
  end

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
      ) unless max_four_decimal_places(i)

			termo_comum = (1+i)**n
      return (pv*((i*termo_comum) / (termo_comum - 1))).round(2)

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

  def self.balance(balance_ant, amortized)
    balance = (balance_ant - amortized).to_d.round(2,:truncate).to_f
    return balance > 0.00 ? balance : 0.00
  end

  def self.juros(balance_ant, taxa)
    begin
      return (balance_ant*percent_to_decimal(taxa)).round(2)
    rescue => e
      raise e
    end
  end

  def self.amortized(juros_att, pmt)
    return (pmt - juros_att).to_d.round(2,:truncate).to_f
  end

  def self.max_four_decimal_places(i)
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