require 'rails_helper'

RSpec.describe Loan, type: :model do
  before(:each) do
    @client = Client.new(name: "Lucas Dalbonio",
                         email: "example@email.com",
                         phone: "21999999999",
                         cpf: "712.132.390-79") #this is a fake valid cpf, it is auto generated
  end

  it 'denies loans with months less or equal than 0' do
    invalid_loan = Loan.create(value: 1000, months: 0, rate: 0.02, client: @client)
    invalid_loan2 = Loan.create(value: 1000, months: -1, rate: 0.02, client: @client)
    valid_loan = Loan.create(value: 1000, months: 1, rate: 0.02, client: @client)
    expect(invalid_loan).to_not be_valid
    expect(invalid_loan2).to_not be_valid
    expect(valid_loan).to be_valid
  end

  it 'denies loans with rate less or equal than 0' do
    invalid_loan = Loan.create(value: 1000, months: 0, rate: 0.00, client: @client)
    invalid_loan = Loan.create(value: 1000, months: 0, rate: -1, client: @client)
    invalid_loan2 = Loan.create(value: 1000, months: -1, rate: 0, client: @client)
    valid_loan = Loan.create(value: 1000, months: 1, rate: 0.02, client: @client)
    expect(invalid_loan).to_not be_valid
    expect(invalid_loan2).to_not be_valid
    expect(valid_loan).to be_valid
  end

  it 'denies loans without client' do
    invalid_loan = Loan.create(value: 1000, months: 1, rate: 0.02, client: nil)
    valid_loan = Loan.create(value: 1000, months: 1, rate: 0.02, client: @client)
    expect(invalid_loan).to_not be_valid
    expect(valid_loan).to be_valid
  end

  it 'should have all fields present' do
    invalid_loan = Loan.create(value: nil, months: 1, rate: 0.02, client: @client)
    invalid_loan2 = Loan.create(value: 1000, months: nil, rate: 0.02, client: @client)
    invalid_loan3 = Loan.create(value: 1000, months: 1, rate: nil, client: @client)
    valid_loan = Loan.create(value: 1000, months: 1, rate: 0.02, client: @client)
    expect(invalid_loan).to_not be_valid
    expect(invalid_loan2).to_not be_valid
    expect(invalid_loan3).to_not be_valid
    expect(valid_loan).to be_valid
 end

 it 'should calculate pmt' do
    loan = Loan.create(value: 1000, months: 12, rate: 0.02, client: @client)
    expect(loan.pmt).to equal(94.56)
 end

end
