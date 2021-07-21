class Loan::Show::InstallmentSerializer < ActiveModel::Serializer
  attributes :parcel_price, :parcel_number
end
