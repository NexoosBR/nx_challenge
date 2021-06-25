class LoanPresenter < SimpleDelegator
  include ActionView::Helpers::NumberHelper

  attr_reader :loan

  def initialize(loan)
    @loan = loan
    __setobj__(loan)
  end

  def eql?(target)
    target == self || loan.eql?(target)
  end
  
  def calculate_pmt
    if loan.present?
      amount = loan.amount.to_i
      term   = loan.term.to_i
      tax    = loan.tax.to_f
      payment = amount * ((((1 + tax)**term) * tax) / (((1 + tax)**term) - 1))
      message = "O pagamento ficou em: #{term} x #{number_to_currency(payment)} - (Com juros total anual de: #{number_to_percentage((tax * 100),
                                        precision: 2, 
                                        strip_insignificant_zeros: true)})"
      return message
    end
  end
end
