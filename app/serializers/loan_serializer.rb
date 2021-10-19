class LoanSerializer < ActiveModel::Serializer
  attributes :loan

  def loan
    {
      'id': object.id,
      'pmt': pmt
    }
  end

  def pmt
    object.calculate
  end
end
