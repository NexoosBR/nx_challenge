class LoanSerializer < ActiveModel::Serializer
  attributes :loan

  def loan
    {
      'id': object.id,
      'pmt': sprintf("%.2f", pmt)
    }
  end

  def pmt
    object.calculate
  end
end
