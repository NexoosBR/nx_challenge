class Loan::Create::InstallmentSerializer < ActiveModel::Serializer
  attributes :parcel_price, :parcel_number
end
