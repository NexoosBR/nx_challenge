require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { is_expected.to validate_presence_of(:denomination, :due_date, :amount) }
end
