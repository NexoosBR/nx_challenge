class LoanSerializer < ActiveModel::Serializer
  attributes :id, :total_value, :total_installment, :customer_id
end
