class ParcelCalculatorService

  def self.call(params)
    finance = params[:finance]
    tax = params[:tax]
    months = params[:months]
    calculate_parcel(finance, tax, months)
  end

  private

  def self.calculate_parcel(finance, tax, months)
    formated_tax = tax / 100
    parcel = finance * (((1 + formated_tax)**months) * formated_tax) /
           (((1 + formated_tax)**months) - 1)
    return parcel.round(2)
  end
end
