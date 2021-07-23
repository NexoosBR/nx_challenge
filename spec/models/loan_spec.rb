require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:loan) { build :loan }

  it 'calculate parcel PMT' do
    loan.save

    expect(loan.pmt_calc.to_f).to eq(1213.64)
  end
end
