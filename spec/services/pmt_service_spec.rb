require 'rails_helper'

RSpec.describe PmtService do
  it "calculates PMT correctly" do
    [
	  [1, 1, 1, 2],
	  [1000, 0.1, 12, 146.76],
	  [100, 0.01, 120, 1.43],
	  [100, 0.01001, 120, 1.44],
    ].each do |amnt, tax, mo, reslt|
    	params = {amount: amnt, monthly_tax: tax, months: mo}
    	out = described_class.calculate(**params)
    	expect(out).to eq(reslt)
    end
  end

end
