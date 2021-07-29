# README

Nexoos Challenge

Seu desafio será completar o desenvolvimento dessa API capaz de gerir empréstimos, salvando informações necessárias do cliente para podermos realizar o cálculo do valor da parcela (PMT), além de haver a possibilidade de leitura desses dados pelo cliente.

Ambiente

* Ruby 2.7.2
* Rails 6.1.3.2
* Database: sqlite

DB ERB

Para rodar

* instalar dependências do projeto
```
bundle install
```
* preparar database
```
rake db:creat:all
rake db:migrate
```
* para inicializar o server
```
rails s
```

Models

* client: representação do cliente, a pessoa a quem pertence o empréstimo, possui o campo email como campo obrigatório
* loan: pertence a um cliente, possui um valor (amount), campo obrigatório, numero de parcelos (months), obrigatório, e uma taxa mensal (montly_rate_percent), obrigatório.

End points

Loans

show loan -> params :id

```curl --request GET http://localhost:3000/loans/1```

Expected Response

```
{
  "id":1,
  "client_id":1,
  "amount":"1000.0",
  "months":12,
  "montly_rate_percent":"1.0",
  "pmt":"88.8487886783417",
  "created_at":"2021-07-29T17:12:54.157Z",
  "updated_at":"2021-07-29T17:12:54.157Z"}
```

Post loan

```
curl --request POST http://localhost:3000/loans -d "loan[amount]=1000" -d "loan[client_id]=1" -d "loan[months]=12" -d "loan[montly_rate_percent]=1"
```

Expected Response:

```
{
  "id":2,
  "client_id":1,
  "amount":"1000.0",
  "months":12,
  "montly_rate_percent":"1.0",
  "pmt":"88.84878867834170733998783122788652898",
  "created_at":"2021-07-29T17:29:52.393Z","updated_at":"2021-07-29T17:29:52.393Z"}
```

Clients

index

```curl --request GET http://localhost:3000/clients```

Expected Response

```
[
  {"id":1,
  "email":"test@testserver.com",
  "created_at":"2021-07-28T12:43:42.408Z",
  "updated_at":"2021-07-28T12:43:42.408Z"
  },
  {"id":2,
  "email":"test2@testserver.com",
  "created_at":"2021-07-28T12:43:47.639Z",
  "updated_at":"2021-07-28T12:43:47.639Z"}]
```

Post client

```
curl --request POST http://localhost:3000/clients -d "client[email]=teste3@testserver.com"
```

Expected Response:

```
{
  "id":3,
  "email":"teste3@testserver.com",
  "created_at":"2021-07-29T17:33:39.397Z",
  "updated_at":"2021-07-29T17:33:39.397Z"}
```

to run the tests

```
rspec
```