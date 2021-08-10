json.loan do
  json.id @loan.id
  json.instalment_number @loan.instalment_number
  json.pmt @loan.pmt
  json.tax @loan.tax
  json.amount @loan.amount
  json.due_date @loan.due_date.strftime('%d/%m/%Y')
end