# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { is_expected.to validate_presence_of(:period_type) }
  it { is_expected.to validate_presence_of(:due_date) }
  it { is_expected.to validate_presence_of(:amount) }
end
