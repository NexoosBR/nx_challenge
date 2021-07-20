json.loan do
  json.id @loan.id
  json.pmt @loan.pmt.to_f
end