require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'is valid when all params is present' do
    client = Client.create(
      first_name: 'Rafael', 
      last_name: 'Carrilho', 
      email: 'rafael@email.com', 
      document: '111.111.111-11',
      birthdate: '2000-02-16'
    )
    expect(client).to be_valid
  end
  it 'full_name render correctly' do
    client = Client.create(
      first_name: 'Rafael',
      last_name: 'Carrilho', 
      email: 'rafael@email.com', 
      document: '111.111.111-11',
      birthdate: '2000-02-16'
    )
    expect(client.full_name).to eq('Rafael Carrilho')
  end

  context 'model validations test' do
    describe 'first_name' do 
      it 'presence must to be true' do
        client = Client.create(
          first_name: nil, 
          last_name: 'Carrilho', 
          email: 'rafael@email.com', 
          document: '111.111.111-11',
          birthdate: '2000-02-16'
        )
        client.valid?
        expect(client.errors[:first_name]).to include("can't be blank")
      end
    end
    describe 'last_name' do
      it 'presence must to be true' do
        client = Client.create(
          first_name: 'Rafael', 
          last_name: nil, 
          email: 'rafael5@email.com', 
          document: '111.111.111-11',
          birthdate: '2000-02-16'
        )
        client.valid?
        expect(client.errors[:last_name]).to include("can't be blank")
      end
    end
    describe 'email' do
      it 'presence must to be true' do
        client = Client.create(
          first_name: 'Rafael', 
          last_name: 'Carrilho', 
          email: nil, 
          document: '111.111.111-11',
          birthdate: '2000-02-16'
        )
        client.valid?
        expect(client.errors[:email]).to include("can't be blank")
      end
      it 'must to be on email format' do
        client = Client.create(
          first_name: 'Rafael', 
          last_name: 'Carrilho', 
          email: 'eunaosouumemail', 
          document: '111.111.111-11',
          birthdate: '2000-02-16'
        )
        client.valid?
        expect(client.errors[:email]).to include("wrong format")
      end
      it 'must to be unique' do
        client = Client.create(
          first_name: 'Rafael',
          last_name: 'Carrilho', 
          email: 'rafael@email.com', 
          document: '111.111.111-11',
          birthdate: '2000-02-16'
        )
        client2 = Client.create(
          first_name: 'Rafael', 
          last_name: 'Carrilho', 
          email: 'rafael8@email.com', 
          document: '111.111.111-11',
          birthdate: '2000-02-16'
        )
        client2.valid?
        expect(client2.errors[:email]).to include('has already been taken')
      end
    end
    describe 'document' do
      it 'presence must to be true' do
        client = Client.create(
          first_name: 'Rafael', 
          last_name: 'Carrilho', 
          email: 'rafael@email.com', 
          document: nil,
          birthdate: '2000-02-16'
        )
        client.valid?
        expect(client.errors[:document]).to include("can't be blank")
      end
      it 'must to be on document format' do
        client = Client.create(
          first_name: 'Rafael', 
          last_name: 'Carrilho', 
          email: 'rafael@email.com', 
          document: '11111111111',
          birthdate: '2000-02-16'
        )
        client.valid?
        expect(client.errors[:document]).to include("wrong format")
      end
      it 'must to be unique' do
        client = Client.create(
          first_name: 'Rafael',
          last_name: 'Carrilho', 
          email: 'rafael@email.com', 
          document: '111.111.111-11',
          birthdate: '2000-02-16'
        )
        client2 = Client.create(
          first_name: 'Rafael', 
          last_name: 'Carrilho', 
          email: 'rafael@email.com', 
          document: '111.111.111-11',
          birthdate: '2000-02-16'
        )
        client2.valid?
        expect(client2.errors[:document]).to include('has already been taken')
      end
    end
    describe 'age' do
      it 'must to be breater than 18' do
        client = Client.create(
          first_name: 'Rafael',
          last_name: 'Carrilho', 
          email: 'rafael@email.com', 
          document: '111.111.111-11',
          birthdate: '2008-02-16'
        )
        client.valid?
        expect(client.errors[:age]).to include("you can't make a loan with this age")
      end
    end
  end
  

end
