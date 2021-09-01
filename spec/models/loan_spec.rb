require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { is_expected.to validate_presence_of(:present_value) }
  it { is_expected.to validate_presence_of(:rate) }
  it { is_expected.to validate_presence_of(:period) }
  it { is_expected.to validate_numericality_of(:present_value).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:rate).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:period).is_greater_than(0) }
end
