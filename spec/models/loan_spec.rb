require 'rails_helper'

RSpec.describe Loan, type: :model do
  # before(:all) do
  #   @client = Client.create(
  #     first_name: 'Rafael',
  #     last_name: 'Carrilho',
  #     email: 'rafael50@email.com',
  #     document: '111.111.150-11',
  #     birthdate: '2000-02-24'
  #   )
  # end
  
  it 'is valid when all params is present' do
    client = Client.create(
      first_name: 'Rafael',
      last_name: 'Carrilho',
      email: 'rafael50@email.com',
      document: '111.111.150-11',
      birthdate: '2000-02-24'
    )
    loan = Loan.create(
      client: client,
      amount: 10000.0,
      rate: 0.2,
      months: 10
    )
    expect(loan).to be_valid
  end

  context 'model validations test' do
    describe 'amount' do
      it 'presence must to be true' do
        client = Client.create(
          first_name: 'Rafael',
          last_name: 'Carrilho',
          email: 'rafael@email.com',
          document: '111.111.111-11',
          birthdate: '2000-02-24'
        )
        loan = Loan.create(
          client: client,
          amount: nil,
          rate: 0.2,
          months: 10
        )
        loan.valid?
        expect(loan.errors[:amount]).to include("can't be blank")
      end
    end
    describe 'rate' do
      it 'presence must to be true' do
        client = Client.create(
          first_name: 'Rafael',
          last_name: 'Carrilho',
          email: 'rafael@email.com',
          document: '111.111.111-11',
          birthdate: '2000-02-24'
        )
        loan = Loan.create(
          client: client,
          amount: 10000.0,
          rate: nil,
          months: 10
        )
        loan.valid?
        expect(loan.errors[:rate]).to include("can't be blank")
      end
    end
    describe 'client' do
      it 'presence must to be true' do
        loan = Loan.create(
          client: nil,
          amount: 10000.0,
          rate: nil,
          months: 10
        )
        loan.valid?
        expect(loan.errors[:client]).to include("must exist")
      end
    end
    describe 'rate' do
      it 'presence must to be true' do
        client = Client.create(
          first_name: 'Rafael',
          last_name: 'Carrilho',
          email: 'rafael@email.com',
          document: '111.111.111-11',
          birthdate: '2000-02-24'
        )
        loan = Loan.create(
          client: client,
          amount: 10000.0,
          rate: nil,
          months: 10
        )
        loan.valid?
        expect(loan.errors[:rate]).to include("can't be blank")
      end
    end
  end

  
end
