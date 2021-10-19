class LoanSerializer < ActiveModel::Serializer
  attributes :loan

  def loan
    {
      'id': object.id,
      'pmt': sprintf("%.2f", pmt).to_f
    }
  end

  def pmt
    object.calculate
  end
end
