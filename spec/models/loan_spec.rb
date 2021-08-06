require 'rails_helper'

RSpec.describe Loan, type: :model do
  subject {
    described_class.new(present_value: 1000.00,
                        rate: 0.02,
                        periods: 4)
  }

  it "is valid with valid attributes" do
    puts subject
    expect(subject).to be_valid
  end

  it "is not valid without a present_value" do
    subject.present_value = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a rate" do
    subject.rate = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without periods" do
    subject.periods = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with present_value lower than zero" do
    subject.present_value = -1000.00
    expect(subject).to_not be_valid
  end

  it "is not valid with rate lower than zero" do
    subject.rate = -1.0
    expect(subject).to_not be_valid
  end

  it "is not valid with periods lower than zero" do
    subject.periods = -3
    expect(subject).to_not be_valid
  end

  it "is not valid with present_value as string" do
    subject.present_value = "test"
    expect(subject).to_not be_valid
  end

  it "is not valid with rate as string" do
    subject.rate = "test"
    expect(subject).to_not be_valid
  end

  it "is not valid with periods as string" do
    subject.periods = "test"
    expect(subject).to_not be_valid
  end

  it "is not valid with rate greater than one" do
    subject.rate = 1.1
    expect(subject).to_not be_valid
  end
end
