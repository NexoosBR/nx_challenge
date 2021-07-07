# Rails: Loan Api

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

This project is a simple backend service that create a loan and calcule the pmt, you can also retrieve the information passing the loan id.

### Some libraries used

Loan Api use some opensource libraries like:

* [rack-cors] - Middleware to CORS support
* [factorybot] - Library to build objects to use in rspec
* [rspec] - Awesome test framework
* [faker] - Library to generate fake data used in factorybot
* [yard] - To generate the documentation

### Install


Loan Api use ruby 2.7.2 make sure you have it installed. After the bundle install create the databse and run the migration

```sh
$ bundle install
$ rake db:create
$ rake db:migrate
```

We are almost there! Now start the server.

```sh
$ rails s
```

### Endpoints

There is a lot of tools to connect with the services, but I recommend [Insomnia](https://insomnia.rest/) it's a great Rest client and you will love it. 

| Name | Endpoint |
| ------ | ------ |
| create loan |[POST]  localhost:3000/loans
| show loan |[GET]  localhost:3000/loans

Now you can start using the services, look the example

```
[POST] localhost:3000/loans/?value=999&tax=2.8&time=12

```
Return example

```
{
  "loan": {
    "id": 1
  }
}
```


```
[GET] localhost:3000/loans/1

```
Return example

```
{
  "loan": {
    "id": 4,
    "pmt": 99.17
  }
}
```

### Tests

Loan Api was built using TDD(Test Driven Development), all development was guided by the tests, all tests can be easily executed running with rspec.

Executar todos os testes:
```sh
$ bundle exec rspec
```

### Project Structure

The project was divided as follows:

* [app/controllers] - Here we have all endpoints of this application
* [app/services] - Service layer used by endpoints
* [lib] - Module for calculate the pmt
* [ext] - Core extensios for string
* [app/spec] - You can find all tests here, a special attention to [app/spec/requests/loan_api_spec.rb] where you can find the main tests

