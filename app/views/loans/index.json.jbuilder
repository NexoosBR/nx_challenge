json.loans @loans do |loan|
  json.id loan.id
  json.amount loan.amount
  json.number_of_months loan.number_of_months
  json.monthly_fee loan.monthly_fee

  json.client do
    json.id loan.client.id
    json.name loan.client.name
    json.phone_number loan.client.phone_number
    json.cpf loan.client.cpf
  end
end