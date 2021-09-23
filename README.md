# README

Loan API:

A simple API to create a loan based off the calculated PMT and also shows and retrieves loans.

Install:
```
bundle install
rails db:setup 
```
Run:
```
rails server
```


Post Request para Loans:

```curl -d "value=1000&taxa=0.2" localhost:3000/loans```

Expected Response:

```
{
  "loan": {
    "id": 1
  }
}
```

Get Request para Loans:

```curl localhost:3000/loans/1```

Expected Response:
```
{
  "loan": {
    "id": 1, "pmt": 308
  }
}
```