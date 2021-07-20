require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { is_expected.to validate_presence_of(:taxa) }
  it { is_expected.to validate_numericality_of(:taxa).is_greater_than(0) }
 
  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_numericality_of(:value).is_greater_than(0) }


end
