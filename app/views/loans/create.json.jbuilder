json.loan do
  json.id @loan.id
  json.amount @loan.amount
  json.number_of_months @loan.number_of_months
  json.monthly_fee @loan.monthly_fee
  json.client_id @loan.client_id
end