class PmtService
  def self.calculate(amount:, monthly_tax:, months:)
    tax_mo = (1 + monthly_tax) ** months
    frac = monthly_tax * tax_mo / (tax_mo - 1)
    (amount * frac).round(2)
  end
end
