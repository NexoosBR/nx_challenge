# Rails: UBS API

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

This project is a simple backend service that receive a latitude and longitude and return all Ubs near parameters passed.

### Some libraries used

UBS API use some opensource libraries like:

* [postgresql] - Robust database for persist data
* [rack-cors] - Middleware to CORS support
* [factorybot] - Library to build objects to use in rspec
* [rspec] - Awesome test framework
* [faker] - Library to generate fake data used in factorybot
* [geocoder] - Complete geocode solution
* [yard] - To generate the documentation

### Install

To use UBS API, first you need have installed postgreSql, The postgreSql can be easily installed in ubuntu using the commmands below:

```sh
$ sudo apt update
$ sudo apt install postgresql postgresql-contrib
$ sudo -u postgres createuser --interactive
```

UBS API also use ruby 3.0.1 make sure you have it installed. We need the seed because we need populate our database with all ubs, check the commands below:

```sh
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

We are almost there! Now start the server.

```sh
$ rails s
```

### Endpoints

There is a lot of tools to connect with the services, but I recommend [Insomnia](https://insomnia.rest/) it's a great Rest client and you will love it. 

| Name | Endpoint |
| ------ | ------ |
| cep  |[GET]  localhost:3000/api/v1/find_ubs

Now you can start using the services, look the example

```sh
[GET] localhost:3000/api/v1/find_ubs/?query=-8.224304,-34.9684098&page=1&per_page=1

```

Return example

```
{
  "current_page": 1,
  "per_page": 1,
  "total_entries": 22,
  "entries": [
    {
      "id": 10,
      "name": "USF SANTA ROSA",
      "address": "RUA SANTA ROSA",
      "district": "PONTEZINHA",
      "city": "Cabo de Santo Agostinho",
      "state": "PE",
      "geocode": {
        "lat": -8.224304,
        "long": -34.9684098
      },
      "ibge": 260290
    }
  ]
}
```

### Tests

UBS API was built using TDD(Test Driven Development), all development was guided by the tests, walltests that can be easily executed running with rspec.

Executar todos os testes:
```sh
$ bundle exec rspec
```

### Project Structure

The project was divided as follows:

* [app/ap1/v1] - Here we have all endpoints of this application
* [app/services] - Service layer used by endpoints
* [app/spec] - You can find all tests here, a special attention to [app/spec/requests/ubs_api_spec.rb] where you can find the main tests

