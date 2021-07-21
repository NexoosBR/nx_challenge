json.loan do
  json.ignore_nil!
  json.(@loan, :id, :pmt)
end