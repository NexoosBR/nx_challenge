json.clients @clients do |client|
  json.id client.id
  json.name client.name
  json.phone_number client.phone_number
  json.cpf client.cpf

  json.loans client.loans do |loan|
    json.id loan.id
    json.amount loan.amount
    json.number_of_months loan.number_of_months
    json.monthly_fee loan.monthly_fee
  end
end