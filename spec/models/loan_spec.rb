require 'rails_helper'

RSpec.describe Loan, type: :model do

  it {should validate_presence_of(:amount)}

  it {should validate_presence_of(:tax)}

  it {should validate_presence_of(:time)}

  it {should validate_presence_of(:pmt)}

end
