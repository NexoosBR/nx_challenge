require 'rails_helper'

RSpec.describe Loans::PmtCalculateService, type: :service do
  it 'calculate pmt' do
    installment = Loans::PmtCalculateService.call(
      amount: 10_000,
      monthly_rate: 0.02,
      months: 12
    )
    expect(installment).to eq(945.6)
  end
end
