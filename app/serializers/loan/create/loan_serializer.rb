class Loan::Create::LoanSerializer < ActiveModel::Serializer
  attributes :id, :total_value, :total_installment, :customer_name

  has_many :installments, serializer: Loan::Create::InstallmentSerializer

  def customer_name
    object.customer.name
  end
end
