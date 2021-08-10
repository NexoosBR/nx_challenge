require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  it { is_expected.to validate_presence_of(:remote_ip) }
end
