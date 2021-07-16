require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'is valid when all params is present' do
    client = Client.create(
      first_name: 'Rafael', 
      last_name: 'Carrilho', 
      email: 'rafael@email.com', 
      document: '176.699.507-14',
      birthdate: '2000-02-16'
    )
    expect(client).to matcher
  end
  it 'full_name render correctly' do
    client = Client.create(
      first_name: 'Rafael',
      last_name: 'Carrilho', 
      email: 'rafael@email.com', 
      document: '176.699.507-14',
      birthdate: '2000-02-16'
    )
    expect(client.full_name).to eq('Rafael Carrilho')
  end

  context 'model validations test' do
    describe 'first_name' do 
      it 'presence must to be true'
        client = Client.create(
          first_name: nil, 
          last_name: 'Carrilho', 
          email: 'rafael@email.com', 
          document: '176.699.507-14',
          birthdate: '2000-02-16'
        )
        client.valid?
        expect(client.errors[:first_name]).to include("can't be blank")
      end
    end
    describe 'last_name' do
      it 'presence must to be true'
        client = Client.create(
          first_name: 'Rafael', 
          last_name: nil, 
          email: 'rafael@email.com', 
          document: '176.699.507-14',
          birthdate: '2000-02-16'
        )
        client.valid?
        expect(client.errors[:last_name]).to include("can't be blank")
      end
    end
    describe 'email' do
      it 'presence must to be true'
        client = Client.create(
          first_name: 'Rafael', 
          last_name: 'Carrilho', 
          email: nil, 
          document: '176.699.507-14',
          birthdate: '2000-02-16'
        )
        client.valid?
        expect(client.errors[:email]).to include("can't be blank")
      end
      it 'must to be on email format'
        client = Client.create(
          first_name: 'Rafael', 
          last_name: 'Carrilho', 
          email: 'eunaosouumemail', 
          document: '176.699.507-14',
          birthdate: '2000-02-16'
        )
        client.valid?
        expect(client.errors[:email]).to include("wrong format")
      end
      it 'must to be unique'
        client = Client.create(
          first_name: 'Rafael',
          last_name: 'Carrilho', 
          email: 'rafael@email.com', 
          document: '176.699.507-14',
          birthdate: '2000-02-16'
        )
        client2 = Client.create(
          first_name: 'Rafael', 
          last_name: 'Carrilho', 
          email: 'rafael@email.com', 
          document: '176.699.507-14',
          birthdate: '2000-02-16'
        )
        client.valid?
        expect(client.errors[:email]).to include("has already been taked")
      end
    end
    describe 'age' do
      it 'must to be breater than 18' do
        client = Client.create(
          first_name: 'Rafael',
          last_name: 'Carrilho', 
          email: 'rafael@email.com', 
          document: '176.699.507-14',
          birthdate: '2004-02-16'
        )
        client.valid?
        expect(client.errors[:age]).to include("you can't make a loan with this age")
      end
    end
  end
  

end
