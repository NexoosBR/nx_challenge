# README

Nexoos Challenge

Instalar as GEMS

```
  bundle install
```

Para criar o banco e rodar os seeds

```
  rails db:create db:migrate db:seeds
```
POST http://localhost:3000/loans

body:

```
  {
    "loan": {
      "value": 1000,
      "taxa": 0.20,
      "quantity": 5
    }
  }
```

response:

```
{
    "message": "Loan created with success",
    "loan": {
        "id": 4,
        "quantity": 5,
        "taxa": 0.2,
        "value": 1000,
        "pmt": 2000,
        "created_at": "2021-07-23T03:07:43.517Z",
        "updated_at": "2021-07-23T03:07:43.547Z"
    }
}
```

GET http://localhost:3000/loans/1

Expected Response:
```
{
    "pmt": 2000,
    "quota": 400,
    "quantity": 5
}

```
Para rodar os testes

bundle exec rspec


Informações de Juciele Wander

```
  E-mail: juciele.wander@hotmail.com
  whats: 17992200419
```