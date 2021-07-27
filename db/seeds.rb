# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




def pmt(value,monthly_fee,months)
  i = i/100
  power = (1 + i)**months
  if power - 1 != 0
    pmt = pv * ((i * power) / (power - 1))
    pmt.round(2)
  else
    errors.add :
end
