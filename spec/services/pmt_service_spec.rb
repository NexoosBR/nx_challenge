require 'rails_helper'

RSpec.describe PmtService do
  def calc(params)
    described_class.calculate(**params)
  end

  it "calculates PMT correctly" do
    [
	  [1, 1, 1, 2],
	  [1000, 0.1, 12, 146.76],
    [1000, 0.2, 12, 225.26],
    [100, 0.5, 5, 57.58],
    ].each do |amnt, tax, mo, result|
    	prms = {amount: amnt, monthly_tax: tax, months: mo}
    	expect(calc(prms)).to eq result
    end
  end

  it "rounds cents correctly" do
    prms1 = {amount: 100, monthly_tax: 0.01, months: 120}
    expect(calc(prms1)).to eq 1.43

    prms2 = {amount: 100, monthly_tax: 0.01001, months: 120}
    expect(calc(prms2)).to eq 1.44
  end

end
