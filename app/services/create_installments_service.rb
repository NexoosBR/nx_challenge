class CreateInstallmentsService
  def initialize(params)
    @loan = params
  end

  def call
    loan_installments
  end

  private

  def loan_installments
    pmt = @loan.total_value / @loan.total_installment

    @loan.total_installment.times do |installment|
      Installment.create(parcel_price: pmt, parcel_number: installment + 1, loan_id: @loan.id)
    end
  end
end