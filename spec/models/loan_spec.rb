# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loan, type: :model do
  subject { build(:loan) }

  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_presence_of(:rate) }
  it { is_expected.to validate_presence_of(:months) }

  it { is_expected.to belong_to(:client) }
end
