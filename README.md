# Loans HTTP REST API

This is an example of a Loan calucule with a HTTP REST API interface. This sample illustrates the loan request with value and interest and receve a result with part of year term.


## Setting up the environment

Have the following requirements installed on your machine:

- Ruby version 2.7.2
- Rails 6.1.3.2
- MacOS X or Linux (Rails is unstable on Windows).


## Usage

After downloading the app. 

```sh
$ bundle
```

### How to run the server

Execute the command as follows to startup the server.
```sh
$ rails s
```
### Running specs

```sh
# Default: Run all spec files (i.e., those matching spec/**/*_spec.rb)
$ bundle exec rspec

# Run only model 
$ bundle exec rspec spec/models

# Run only request
$ bundle exec rspec spec/requests

```


## HTTP REST API Endpoints

The table bellow describes each endpoint. 

| Path          | Method | Request Body                                   | Description                                      |
|---------------|--------|------------------------------------------------|--------------------------------------------------|
| /loans        | POST   | `{ "value": 1000, "taxa": 0.2}`                | Add an value and interest rate                   |
| /loans/`<id>` | GET    | N/A                                            | Receive a part of year term given an loan `id`. |
