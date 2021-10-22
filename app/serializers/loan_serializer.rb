class LoanSerializer < ActiveModel::Serializer
  attributes :id, :pmt

  def pmt
    object.pmt.to_f
  end
end
