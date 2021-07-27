require 'rails_helper'

RSpec.describe Client, type: :model do
  it "is not valid without an email" do
    client = Client.new(email: nil)
    expect(client).to_not be_valid
  end

  it "is valid - email is ok" do
    client = Client.new(email: "this_is_a_test@server.com")
    expect(client).to be_valid
  end

  it "invalid - email not ok" do
    client = Client.new(email: "this_is_a_test")
    expect(client).to_not be_valid
  end
end
