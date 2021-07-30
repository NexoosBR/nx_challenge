require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:valid_params){ {months: 1, monthly_tax: 0.001, amount: 0.01} }
  subject { described_class.new(valid_params) }

  # Positive cases

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "calculates PMT correctly" do
    described_class.new(months: 1, monthly_tax: 0.001, amount: 0.01)
  end

  it "calculates PMT when object is created" do
    subject.save
    expect(subject.pmt).to eq(PmtService.calculate(**valid_params))
  end

  it "doesn't calculate PMT when objectis invalid" do
    subject.months = 0
    subject.save
    expect(subject.pmt).to be_nil
  end

  # Negative cases

  it "is invalid for monthly tax == 0" do
    # note: monthly tax can't be 0
    # otherwise PMT calc will raise ZeroDivisionError
    subject.monthly_tax = 0.0
    expect(subject).to_not be_valid
  end

  it "is invalid for months < 1" do
    # note: num. months can't be 0
    # otherwise PMT calc will raise ZeroDivisionError
    [0, -1].each do |months|
      subject.months = months
      expect(subject).to_not be_valid
    end
  end

  it "is invalid for numerical months value else than integer" do
    [0.6, 1.1].each do |months|
      subject.months = months
      expect(subject).to_not be_valid
    end
  end

  it "is invalid for monthly tax < 0" do
    [-1, -0.01].each do |tax|
      subject.monthly_tax = tax
      expect(subject).to_not be_valid
    end
  end

  it "is invalid for amount < 0" do
    [-1, -0.01, 0, 0.001].each do |amount|
      subject.amount = amount
      expect(subject).to_not be_valid
    end
  end
end
