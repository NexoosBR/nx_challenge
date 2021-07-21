require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'should have all fields present' do
    #this is a fake valid cpf, it is auto generated
    invalid_client = Client.create(name: nil, email: "example@email.com", phone: "21999999999", cpf: "712.132.390-79") 
    invalid_client2 = Client.create(name: "Lucas Dalbonio", email: nil, phone: "21999999999", cpf: "712.132.390-79") 
    invalid_client3 = Client.create(name: "Lucas Dalbonio", email: "example@email.com", phone: nil, cpf: "712.132.390-79") 
    invalid_client4 = Client.create(name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: nil) 
    valid_client = Client.create(name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: "712.132.390-79")  
    expect(invalid_client).to_not be_valid
    expect(invalid_client2).to_not be_valid
    expect(invalid_client3).to_not be_valid
    expect(invalid_client4).to_not be_valid
    expect(valid_client).to be_valid
  end

  it 'denies clients with invalid cpf' do
    invalid_client = Client.create(name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: "000.000.000-00") 
    valid_client = Client.create(name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: "712.132.390-79")  
    expect(invalid_client).to_not be_valid
    expect(valid_client).to be_valid
  end

  it 'denies clients with invalid email' do
    invalid_client = Client.create(name: "Lucas Dalbonio", email: "@email.com", phone: "21999999999", cpf: "712.132.390-79") 
    invalid_client2 = Client.create(name: "Lucas Dalbonio", email: "exampleemail.com", phone: "21999999999", cpf: "712.132.390-79")  
    invalid_client3 = Client.create(name: "Lucas Dalbonio", email: "exampleemailcom", phone: "21999999999", cpf: "712.132.390-79")  
    invalid_client4 = Client.create(name: "Lucas Dalbonio", email: "example@emailcom", phone: "21999999999", cpf: "712.132.390-79")  
    valid_client = Client.create(name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: "712.132.390-79")  
    expect(invalid_client).to_not be_valid
    expect(invalid_client2).to_not be_valid
    expect(invalid_client3).to_not be_valid
    expect(invalid_client4).to_not be_valid
    expect(valid_client).to be_valid
  end

  it 'should have unique cpf' do
    client1 = Client.create(name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: "712.132.390-79") 
    client2 = Client.create(name: "Lucas Dalbonio", email: "example@email.com", phone: "21999999999", cpf: "712.132.390-79")  
    expect(client2).to_not be_valid
  end
end
