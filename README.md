# Nexoos Loan Api

#Loan API
- This API provides loans calculations through 
clients data inputs
- It receives the client's present value (PV), period (months), and interest rate (%), and, calculates the PMT(monthly payment).

## GEMs 

Main Opensource libraries used in this project.

- [sackcors]:https://github.com/cyu/rack-cors
- [sbuider]:https://github.com/rails/jbuilder
- [sspec]:https://github.com/rspec/rspec
- [sactoryBot]:https://github.com/thoughtbot/factory_bot
- [shouldasatchers]:https://github.com/thoughtbot/shoulda-matchers

### Requirements

You need to install ruby 2.7.2 to get this project running.
## Installation

```sh
$ bundle install
$ rake db:create
$ rake db:migrate
```

Upload server

```sh
$ rails s
```

## Documentation

📖 **[Read the documentation for the latest version][postman].** 
[postman]:https://documenter.getpostman.com/view/2112758/TzsWuA3B

## Endpoints

Loans POST request

```sh
curl --request POST --header "Content-Type: application/json" -d '{"rate": 0.2, "value": 1000,"months_period": 12}' http://localhost:3000/loans
```
Response format

```json
{
  "loan": {
    "id": 1
  }
}
```
Loans GET request

```sh
curl --request GET http://localhost:3000/loans/1
```

Response format

```json
{
  "loan": {
    "id": 4,
    "pmt": 99.17
  }
}
```
## Rpsec Tests

### Test's coverage using BDD: 
- unit 
- functional

Run

```sh
$ bundle exec rspec
```

### Develop and tested by  👾**[matts]** 👾
[matts]:https://www.linkedin.com/in/felixmatheus/
