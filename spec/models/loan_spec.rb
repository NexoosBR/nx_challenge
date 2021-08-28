# frozen_string_literal: true

require "rails_helper"

RSpec.describe Loan, type: :model do
  subject(:loan) { build(:loan) }

  describe " Loan validations" do
    it { is_expected.to validate_presence_of(:present_value) }
    it { is_expected.to validate_presence_of(:tax) }
    it { is_expected.to validate_numericality_of(:tax).is_greater_than_or_equal_to(0.1) }
    it { is_expected.to validate_numericality_of(:present_value).is_greater_than_or_equal_to(0.1) }
    it { is_expected.to be_valid }
  end
end
